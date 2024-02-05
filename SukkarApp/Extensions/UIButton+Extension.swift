//
//  UIButton+Extension.swift
//  SukkarApp
//
//  Created by Engy on 1/4/2567 BE.
//

import Foundation
import UIKit
extension UIButton{
//MARK: - add raduis to button
    func addradiusBtn(radius: CGFloat){
        self.layer.cornerRadius = radius
    }
//MARK: - make button rounded
         func addroundedBtn(_ button: UIButton) {
             button.layer.cornerRadius = button.frame.height/2
        }
//MARK: - add border to button
    func addBorderBtn(color:Colors,width:CGFloat){
        self.layer.borderColor = UIColor(named:color.rawValue)?.cgColor
        self.layer.borderWidth = width
    }
//MARK: - add background & raduis
    func addBackgroundAndRaduisBtn(backgroundColor:Colors,raduis:Int){
        self.backgroundColor = UIColor(named: backgroundColor.rawValue)
        self.layer.cornerRadius = CGFloat(raduis)
    }
//MARK: - add Border And Raduis Btn
    func addBorderAndRaduisBtn(borderColor:Colors, borderWith:Int, raduis:Int){
        self.layer.borderColor = UIColor(named:borderColor.rawValue)?.cgColor
        self.layer.borderWidth = CGFloat(borderWith)
        self.layer.cornerRadius = CGFloat(raduis)
    }
//MARK: - add Under line Title TO Button
    func addUnderlineTitle(titleColor: Colors = .CE2E2E2, font: Fonts = .Regular, size: Size = .size_16, title: BTNs){
        self.tintColor = titleColor.hex
        let size = iPhoneXFactor*(CGFloat(size.rawValue))
        let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont(name: (font.rawValue.localized), size: size)!,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ] // .double.rawValue, .thick.rawValue
        let attributeString = NSMutableAttributedString(
            string: title.rawValue.localized,
                attributes: yourAttributes
             )
             self.setAttributedTitle(attributeString, for: .normal)
    }
//MARK: - custom Button
    func customBtn(titleColor: Colors = .CFFFFFF, font: Fonts = .Regular , size: Size = .size_14 , title: BTNs){
        self.tintColor = UIColor(named: titleColor.rawValue)
        let size = iPhoneXFactor*(CGFloat(size.rawValue))
        self.titleLabel?.font = UIFont(name: (font.rawValue.localized), size: size)
        self.setTitle(title.rawValue.localized, for: .normal)
    }
    
    
//MARK: - change text color in case arabic
    func btnTxtColorInArbaic(txtColorAR: Colors){
        if !isEnglish() {
            self.tintColor = txtColorAR.hex
        }
                
            }
//MARK: -
    
    
}

//MARK: - class
class RoundButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
    }
}


