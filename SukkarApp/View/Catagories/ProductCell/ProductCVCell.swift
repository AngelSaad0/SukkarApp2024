//
//  ProductCVCell.swift
//  SukkarApp
//
//  Created by Engy on 12/21/2566 BE.
//

import UIKit

class ProductCVCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addRadiusView(radius:16)
    }
    
    func initCell(cellData:ProductCatM){
        lbl.text = cellData.title
       
            
        }
        
    }
struct ProductCatM{
    var title:String

}

