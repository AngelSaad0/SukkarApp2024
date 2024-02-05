//
//  AccountCVCel.swift
//  SukkarApp
//
//  Created by Engy on 12/21/2566 BE.
//

import UIKit

class AccountCVCell: UICollectionViewCell {
    @IBOutlet weak var accontLb: UILabel!
    @IBOutlet weak var accountImg: UIImageView!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func initCell(cellData:AccountsM){
        accontLb.text = cellData.title
        accountImg.image = cellData.img
        accontLb.textColor = (cellData.isSelcted) ?  UIColor(named: Colors.C0079FB.rawValue) :  UIColor(named: Colors.C535353.rawValue)
        
    }

}


struct AccountsM{
    var title:String
    var img:UIImage?
    var isSelcted:Bool
}
