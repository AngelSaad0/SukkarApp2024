//
//  ContactVcCell.swift
//  SukkarApp
//
//  Created by Engy on 1/8/2567 BE.
//

import UIKit

class ContactCVCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func initCell(cellData:ContactModel){
        img.image = UIImage(named: cellData.img)
        
    }
    

}

struct ContactModel{
  let img:String
}
