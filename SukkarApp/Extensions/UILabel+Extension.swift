//
//  UILabel+Extension.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit

extension UILabel {
    
    func customLbl(txtColor: Colors = .C707070, size: Size = .size_14, font: Fonts = .Regular, text:Lbls, direction: Direction = .Normal, nOlines: Int = 1) {
        
        let size = iPhoneXFactor*(CGFloat(size.rawValue))
        self.font = UIFont(name: font.font, size: size)
        
        
        switch direction {
        case .Left: self.textAlignment = ((isEnglish()) ? .left : .left)
        case .Right: self.textAlignment = ((isEnglish()) ? .right : .right)
        case .Normal: self.textAlignment = ((isEnglish()) ? .left : .right)
        case .Center: self.textAlignment = .center
            
        }
        self.textColor = UIColor(named: txtColor.rawValue)
        //self.textColor = UIColor(hexString: txtColor.rawValue)
       // self.textColor = txtColor.hex
        self.text = text.rawValue.localized
    }
    
    
//MARK: - change text color in case arabic
    func LblTxtColorInArbaic(txtColorAR: Colors, txtColorEn: Colors){
     self.textColor = UIColor(named: (isEnglish()) ?  (txtColorEn.rawValue):(txtColorAR.rawValue))
        
    }

}

