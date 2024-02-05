//
//  CategoriesCVCell.swift
//  SukkarApp
//
//  Created by Engy on 1/3/2567 BE.
//

import UIKit

class CategoriesCVCell: UICollectionViewCell {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var mainView: UIView!
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
           DispatchQueue.main.async {
               self.mainView.layer.cornerRadius = self.mainView.bounds.height/2
               self.mainView.layer.borderWidth = 1
              
           }
           
       }
       func initCell(cellData:CategoriesCatM){
           lbl.text = cellData.title
           mainView.addBorderView(color:(cellData.isSelected) ? Colors.C0079FB : Colors.CE2E2E2, width: 1)
//           if cellData.isSelected {
//               self.mainView.layer.borderColor = UIColor(named: Colors.C0079FB.rawValue)?.cgColor
//               lbl.textColor = UIColor(named:Colors.C0079FB.rawValue)
//               
//           }else{
//               self.mainView.layer.borderColor = UIColor(named: Colors.CE2E2E2.rawValue)?.cgColor
//               lbl.textColor = UIColor(named:Colors.C2E2E2E.rawValue)
//               
//           }
           
       }

   }

   struct CategoriesCatM{
       var title:String
       var isSelected:Bool

}
