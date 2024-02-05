//
//  OrderDetailsTVCell.swift
//  SukkarApp
//
//  Created by Engy on 12/30/2566 BE.
//

import UIKit

class OrderDetailsTVCell: UITableViewCell {

    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var orderImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func initCell(cellData:OrderDetails){
        orderImg.image = UIImage(named: cellData.img)
        quantityLbl.text = cellData.quantity
        priceLbl.text = cellData.price
        
    }
    
}
struct OrderDetails{
    var img:String
    var price:String
    var quantity:String
}
