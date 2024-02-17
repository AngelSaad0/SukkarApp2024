//
//  UILabel+Extension.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit

extension UILabel {
//    func customTxtField(txtColor: Color = .C9E9E9E ,placeholderColor: Color = .C9E9E9E , size: Size = .size_14, font: Fonts = .regular, placeholder: TxtField, text: String? = "", isPassword: Bool = false, isCenter: Bool = false) {
    func customLbl(txtColor: Color = .C707070, size: Size = .size_14, font: Fonts = .regular, text:Lbls, direction: Direction = .normal, nOlines: Int = 1) {

        let size = iPhoneXFactor*(CGFloat(size.rawValue))
        self.font = UIFont(name: font.font, size: size)

        switch direction {
        case .left: self.textAlignment = ((isEnglish()) ? .left : .left)
        case .right: self.textAlignment = ((isEnglish()) ? .right : .right)
        case .normal: self.textAlignment = ((isEnglish()) ? .left : .right)
        case .center: self.textAlignment = .center

        }
        self.textColor = UIColor(named: txtColor.rawValue)
        //self.textColor = UIColor(hexString: txtColor.rawValue)
       // self.textColor = txtColor.hex
        self.text = text.rawValue.localized
    }
    
    
//MARK: - change text color in case arabic
    func LblTxtColorInArbaic(txtColorAR: Color, txtColorEn: Color){
     self.textColor = UIColor(named: (isEnglish()) ?  (txtColorEn.rawValue):(txtColorAR.rawValue))
        
    }

}

