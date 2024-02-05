//
//  ChartTVCell.swift
//  SukkarApp
//
//  Created by Engy on 1/9/2567 BE.
//

import UIKit

class ChartTVCell: UITableViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initCell(cellData:ChartModel){
        productImg.image = UIImage(named: cellData.img)
        productPrice.text = cellData.price
        productName.text = cellData.name
        
        
    }
    
}
struct ChartModel {
    let img : String
    let price : String
    let name : String
    
}
