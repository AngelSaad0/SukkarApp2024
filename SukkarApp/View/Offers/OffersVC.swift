//
//  OffersVC.swift
//  SukkarApp
//
//  Created by Engy on 12/8/2566 BE.
//

import UIKit

class OffersVC: UIViewController {
    @IBOutlet weak var offersCV: UICollectionView!
    @IBOutlet weak var offersPageControl: UIPageControl!


    let offersList = ["img5","img5","img5","img5","img5"]
    var currentPage = 0
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        addNavBar(items: [.menu, .notifaction, .back],title: .none)
        initUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        mangeNavigation(isHidden: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        mangeNavigation(isHidden: false)
    }
}

// MARK: -  helper

extension OffersVC {

    func initUI() {
        self.title = "Offers"
        startTimer()
        offersPageControl.numberOfPages = offersList.count
        initCollectionView(collectionView: offersCV)

    }
    func initCollectionView(collectionView:UICollectionView){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCVNib(cell: OffersCVCell.self)
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
    }

    @objc func timeAction() {
        let scrollPostion = (currentPage<offersList.count-1) ? currentPage+1 : 0
        offersCV.scrollToItem(at: IndexPath(item: scrollPostion, section: 0), at: .centeredHorizontally, animated: true)

    }

}


// MARK: - UICollectionViewDataSource
extension OffersVC:UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offersList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCVCell(index: indexPath) as OffersCVCell
        cell.img.image = UIImage(named: offersList[indexPath.row])
      
        return cell
    }

}
// MARK: - UICollectionViewDelegateFlowLayout
extension OffersVC:UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let collectionViewHiegth = collectionView.bounds.height
        return CGSize(width: collectionViewWidth, height: collectionViewHiegth)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x/scrollView.frame.width)
        offersPageControl.currentPage = currentPage
        
    }
    
}
