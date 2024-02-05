//
//  FeaturedCVCell.swift
//  SukkarApp
//
//  Created by Engy on 12/9/2566 BE.
//

import UIKit

class FeaturedCVCell: UICollectionViewCell {

    @IBOutlet weak var imgDark: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.addRadiusView(radius: 18)
        //img.layer.cornerRadius = 16
        //imgDark.layer.cornerRadius = 20
        
       
    }
    

}
