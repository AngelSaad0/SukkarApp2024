//
//  CategoriesHomeVCCell.swift
//  SukkarApp
//
//  Created by Engy on 12/9/2566 BE.
//

import UIKit

class CategoriesHomeVCCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addRadiusView(radius: 20)
        // Initialization code
    }
    func initCell(cellData:CategoriesHomM){
        lbl.text = cellData.title
    }

}
struct CategoriesHomM{
    var title:String

}
