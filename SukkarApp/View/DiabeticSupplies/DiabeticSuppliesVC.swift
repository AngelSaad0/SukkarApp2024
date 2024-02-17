//
//  DiabeticSuppliesVC.swift
//  SukkarApp
//
//  Created by Engy on 1/3/2567 BE.
//

import UIKit

class DiabeticSuppliesVC: UIViewController {

    @IBOutlet weak var diabeticSuppliesCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        mangeNavigation(isHidden: false)
    }

}
//MARK: - DiabeticSuppliesVC FUNC

extension DiabeticSuppliesVC {
    func initUI() {

        addNavBar(items: [.notifaction, .back, .menu] , title: .diabetic)
        diabeticSuppliesCV.delegate = self
        diabeticSuppliesCV.dataSource = self
        diabeticSuppliesCV.registerCVNib(cell: DiabeticSuppliesCell.self)
    }
}
//MARK: - DiabeticSuppliesVC
extension DiabeticSuppliesVC:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc:UIViewController = DiabeticMoreDetailsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
//MARK: - DiabeticSuppliesVC
extension DiabeticSuppliesVC:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCVCell(index: indexPath) as DiabeticSuppliesCell
        return cell
    }
    
    
}
//MARK: - DiabeticSuppliesVC
extension DiabeticSuppliesVC:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: width*0.8)
    }
    
}

