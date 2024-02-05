//
//  HomeVC.swift
//  SukkarApp
//
//  Created by Engy on 12/8/2566 BE.
//

import UIKit

class HomeVC: UIViewController {
    let sliderList = ["img1","img1","img1","img1","img1","img1","img1","img1","img1"]
    var catagoriesList:[CategoriesHomM] = []
    var featuredList = ["img9","img9","img9","img9"]
    var timer:Timer?
    var currentPage = 0
    @IBOutlet weak var sliderCV: UICollectionView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var featuredCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        mangeNavigation(isHidden: true)
    }
}
//MARK: - initUI // func
extension HomeVC {
    
    func initUI(){
        sliderPageControl.numberOfPages = sliderList.count
        startTimer()
        initCV(cvs: [sliderCV,categoriesCV,featuredCV])
        catagoriesList.append(CategoriesHomM(title: "Diabetic Supplies"))
        catagoriesList.append(CategoriesHomM(title: "Other"))
    }
    func initCV(cvs:[UICollectionView]){
       for cv in cvs {
            cv.delegate = self
            cv.dataSource = self
        }
        cvs[0].registerCVNib(cell: SliderCVCell.self)
        cvs[1].registerCVNib(cell: CategoriesHomeVCCell.self)
        cvs[2].registerCVNib(cell: FeaturedCVCell.self)
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
    }
    @objc func timeAction(){
        let scrollPostion = (currentPage<sliderList.count-1) ? currentPage+1 : 0
        sliderCV.scrollToItem(at: IndexPath(item: scrollPostion, section: 0), at: .centeredHorizontally, animated: true)
    }
}

//MARK: - UICollectionViewDelegate
extension HomeVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            if catagoriesList[indexPath.row].title == "Diabetic Supplies" {
                let vc:UIViewController = DiabeticSuppliesVC()
              
                
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
//MARK: - UICollectionViewDataSource
extension HomeVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0 : return sliderList.count
        case 1 : return catagoriesList.count
        default : return featuredList.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag{
                        case 0:
                            let cell = collectionView.dequeueCVCell(index: indexPath) as SliderCVCell
                                cell.img.image = UIImage(named: sliderList[indexPath.row])
                            return cell
                        case 1:
                            let cell = collectionView.dequeueCVCell(index: indexPath) as CategoriesHomeVCCell
                         cell.initCell(cellData: catagoriesList[indexPath.row])
                            return cell
                        default :
                            let cell = collectionView.dequeueCVCell(index: indexPath) as FeaturedCVCell
                            cell.img.image = UIImage(named: featuredList[indexPath.row])
                            return cell
        
                        }
    }
    
}
//MARK: - UICollectionViewDelegateFlowLayout
extension HomeVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0 :
            let collectionViewWidth = collectionView.bounds.width
            let collectionViewHeight = collectionView.bounds.height
            return CGSize(width: collectionViewWidth, height: collectionViewHeight)
        case 1:
            let numberOfCellInRow:CGFloat = 2
            let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout
            let collectionViewWidth = collectionView.bounds.width
            let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
            let adjustWidth = collectionViewWidth-spacingBetweenCell
            let width = adjustWidth/numberOfCellInRow
            return CGSize(width: width, height: width*0.699346405228758)
        default:
            let collectionViewHeight = collectionView.bounds.height
            return CGSize(width: collectionViewHeight*1.2488, height:collectionViewHeight)
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 0{
            currentPage = Int(scrollView.contentOffset.x/scrollView.frame.width)
            sliderPageControl.currentPage = currentPage
        }
    }
    
}
