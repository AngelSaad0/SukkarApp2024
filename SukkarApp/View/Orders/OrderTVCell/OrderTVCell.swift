//
//  OrderTVCell.swift
//  SukkarApp
//
//  Created by Engy on 12/22/2566 BE.
//

import UIKit
protocol OrderTVCellProtocol:NSObjectProtocol{
    func selectedIndex(cellCase:String)
}


class OrderTVCell: UITableViewCell {
    var cellName:String?
    weak var cellDelegate : OrderTVCellProtocol?
    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var stautsLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        mainView.addBorderView(color:Color.CD9D9D9, width: 1)
        mainView.addRadiusView(radius: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func initCell(cellData:Orders){
        dateLbl.text = cellData.orderDate
        numberLbl.text = cellData.orderNumber
        priceLbl.text = cellData.orderPrice
        stautsLbl.text = cellData.orderStatus
        switch cellData.orderStatus{
        case "Delivered" :
            cellName = "Delivered"
            stautsLbl.textColor = UIColor(named: Color.C24955C.rawValue)
            arrowImg.tintColor  = UIColor(named: Color.C24955C.rawValue)
           
            return
        case "Pending" :
            cellName = "Pending"
            stautsLbl.textColor = UIColor(named: Color.CDB0000.rawValue)
            arrowImg.tintColor  = UIColor(named: Color.CDB0000.rawValue)
            return
        default:
            cellName = "Processing"
            stautsLbl.textColor = UIColor(named: Color.C0079FB.rawValue)
            arrowImg.tintColor  = UIColor(named: Color.C0079FB.rawValue)
            return
        }
    }
    @IBAction func arrowBtnClicked(_ sender: UIButton){
        cellDelegate?.selectedIndex(cellCase:cellName ?? "")
       
    }
    
 
    
}
struct Orders {
    let orderDate:String
    let orderNumber :String
    let orderPrice: String
    let orderStatus: String
}
