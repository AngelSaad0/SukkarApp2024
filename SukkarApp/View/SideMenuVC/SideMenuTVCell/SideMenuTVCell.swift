//
//  SideMenuTVCell.swift
//  SukkarApp
//
//  Created by Engy on 1/8/2567 BE.
//

import UIKit

class SideMenuTVCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
    }
    func initCell(cellData:SlideMenuM){
        titleLb.text = cellData.title
        img.image = UIImage(named: cellData.img)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

struct SlideMenuM {
    var img:String
    var title:String
   
    
}

