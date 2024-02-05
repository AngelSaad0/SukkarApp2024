//
//  OrderDetailsCVCell.swift
//  SukkarApp
//
//  Created by Engy on 12/30/2566 BE.
//

import UIKit

class OrderDetailsCVCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.addBorderView(color: Colors.CE2E2E2, width: 1)
        mainView.addRadiusView(radius: 10)
    }

}
