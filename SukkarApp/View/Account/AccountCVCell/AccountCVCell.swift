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

    func initCell(cellData:AccountsM) {
        accontLb.text = cellData.tit.rawValue.localized
        accountImg.image = cellData.img

    }
}
struct AccountsM {
    var tit: VcTitle
    var img:UIImage?
}


