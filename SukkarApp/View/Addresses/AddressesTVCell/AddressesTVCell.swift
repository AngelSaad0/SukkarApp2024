//
//  AddressesTVCell.swift
//  SukkarApp
//
//  Created by Engy on 12/21/2566 BE.
//

import UIKit
protocol AddressesTVCellProtocol:NSObjectProtocol{
    func isDefault(index:Int)
}
class AddressesTVCell: UITableViewCell {
    
    var cellIndex = 0
    var toggleDefault = false
    weak var cellDelegate : AddressesTVCellProtocol?
    @IBOutlet weak var defaultImg: UIImageView!
    @IBOutlet weak var defaultLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    @IBAction func isDefaultBtnClicked(_ sender: UIButton) {
        toggleDefault.toggle()
        cellDelegate?.isDefault(index: cellIndex)
    }
    
    func initCell(cellData:Addresses,index:Int){
        cellIndex = index
        titleLbl.text = cellData.title
        detailsLbl.text = cellData.details
        defaultLbl.textColor = UIColor(named: cellData.isDefault ?  Colors.C0079FB.rawValue : Colors.CBFBFBF.rawValue)
        defaultImg.image = UIImage(named: (cellData.isDefault) ? "default_sel": "default_usel")
        
    }
}

//MARK: - Addresses Model
struct Addresses{
    var title: String
    var details:String
    var isDefault:Bool
    
}
