//
//  DiabeticSuppliesCell.swift
//  SukkarApp
//
//  Created by Engy on 1/3/2567 BE.
//

import UIKit

class DiabeticSuppliesCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addRadiusView(radius: 18)
    }

}
