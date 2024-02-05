//
//  CatagoriesVC.swift
//  SukkarApp
//
//  Created by amgad on 12/8/2566 BE.
//

import UIKit

class CatagoriesVC: UIViewController {
    
    @IBOutlet weak var catagoriesCV: UICollectionView!
    @IBOutlet weak var productCV: UICollectionView!
    var catagoriesList:[CategoriesCatM] = []
    var productList:[ProductCatM]  = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        mangeNavigation(isHidden: true)
    }
}

//MARK: - INITUI() _____ CategoryVC
extension CatagoriesVC {
    func initUI(){
        initCV(cvs: [catagoriesCV,productCV])
        productList.append(ProductCatM(title: "Blood Glucose"))
        productList.append(ProductCatM(title: "Blood pressure "))
        productList.append(ProductCatM(title: "Medical headsets"))
        productList.append(ProductCatM(title: "Thermomerers"))
        productList.append(ProductCatM(title: "Blood Glucose"))
        productList.append(ProductCatM(title: "Blood pressure "))
        productList.append(ProductCatM(title: "Medical headsets"))
        productList.append(ProductCatM(title: "Thermomerers"))
        
        
        catagoriesList.append(CategoriesCatM(title: "all", isSelected: false))
        catagoriesList.append(CategoriesCatM(title: "Diabetic Supplies", isSelected: false))
        catagoriesList.append(CategoriesCatM(title: "first catagory", isSelected: false))
        catagoriesList.append(CategoriesCatM(title: "second item", isSelected: false))
        catagoriesList.append(CategoriesCatM(title: "Diabetic Supplies number 2", isSelected: false))
        
    }
    func initCV(cvs:[UICollectionView]){
        for cv in cvs {
            cv.delegate = self
            cv.dataSource = self
        }
        cvs[0].registerCVNib(cell: CategoriesCVCell.self)
        cvs[1].registerCVNib(cell: ProductCVCell.self)
    }
}

// MARK: - UICollectionViewDataSource
extension CatagoriesVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 0 :
            return catagoriesList.count
        default :
            return productList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag{
        case 0:
            let cell = collectionView.dequeueCVCell(index: indexPath) as CategoriesCVCell
            cell.initCell(cellData: catagoriesList[indexPath.row])
            return cell
        default: let cell = collectionView.dequeueCVCell(index: indexPath) as ProductCVCell
            cell.initCell(cellData: productList[indexPath.row])
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CatagoriesVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0 :
            let collectionViewHeight = collectionView.bounds.height
            let collectionViewWidth  = calculateCellWidht(text: catagoriesList[indexPath.row].title)
            return CGSize(width: collectionViewWidth, height: collectionViewHeight)
        default :
            let numberOfCellInRow:CGFloat = 2
            let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout
            let collectionViewWidth = collectionView.bounds.width
            let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
            let adjustWidth = collectionViewWidth-spacingBetweenCell
            let width = adjustWidth/numberOfCellInRow
            return CGSize(width: width, height: width*0.809)
        }
    }
    private func calculateCellWidht(text : String)-> CGFloat{
        let cell = Bundle.main.loadNibNamed("CategoriesCVCell", owner: self)?.first as! CategoriesCVCell
        cell.lbl.text = text
        let fittingSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: cell.bounds.height)
        let size = cell.contentView.systemLayoutSizeFitting(fittingSize)
        return size.width
    }
    
    }

// MARK: - UICollectionViewDelegate
extension CatagoriesVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            for index in 0..<catagoriesList.count {
                catagoriesList[index].isSelected = false
            }
            catagoriesList[indexPath.row].isSelected = true
            catagoriesCV.reloadData()
        }
    }
    
}
    
   
    

