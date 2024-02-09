//
//  UITextField+Extension.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit
import MOLH

extension UITextField {
//MARK: - customTxtFmield
    func customTxtField(txtColor: Colors = .C9E9E9E ,placeholderColor: Colors = .C9E9E9E , size: Size = .size_14, font: Fonts = .Regular, placeholder: TxtFields, text: String? = "", isPassword: Bool = false, isCenter: Bool = false) {
        let size = iPhoneXFactor*(CGFloat(size.rawValue))
        self.tintColor = UIColor(named: txtColor.rawValue)
        self.textColor = UIColor(named: txtColor.rawValue)
        self.font = UIFont(name: font.rawValue.localized, size: size)
        self.borderStyle = .none
        if(text == ""){
            self.attributedPlaceholder = NSAttributedString(string: placeholder.rawValue.localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: placeholderColor.rawValue) ?? .blue])
            self.placeholder = placeholder.rawValue.localized
           
        }
        self.placeholder = placeholder.rawValue.localized
        if (!((text?.isEmpty) == nil)) {
            self.text = text
            
        }
        
        self.isSecureTextEntry = isPassword ? true : false
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.textAlignment =  isCenter ? .center : (MOLHLanguage.isArabic() ? .right : .left)
        self.returnKeyType = .default
    }
//MARK: - change text color in case arabic
        func txtFieldTxtColorInArbaic(txtColorAR: Colors, txtColorEn: Colors){
         self.textColor = UIColor(named: (isEnglish()) ?  (txtColorEn.rawValue):(txtColorAR.rawValue))
            
        }
//MARK: - clearTextFieldPadding
    func clearTextFieldPadding() {
        let leftPaddingView = UIView(frame: CGRect(x: 0*iPhoneXFactor, y: 0, width: 0*iPhoneXFactor, height: self.frame.size.height))
        self.leftView = leftPaddingView
        self.leftView?.isHidden = true
        self.rightView?.isHidden = true
    }
//MARK: - clearTextFieldPadding
    func adjustPadding(widthForPadding : CGFloat) {
        let leftPaddingView = UIView(frame: CGRect(x: 30*iPhoneXFactor, y: 0, width: widthForPadding, height: self.frame.size.height))
        leftPaddingView.backgroundColor = .green
        self.leftView = leftPaddingView
        self.leftView?.isHidden = false
        self.rightView?.isHidden = false
        
    }
//MARK: - addLowerLine
    func addLowerLine(withColor : UIColor){
        let line = UIView()
        line.backgroundColor = withColor
        line.frame = CGRect(x: 0,
                            y: self.frame.height - 1, width: self.frame.width, height: 1)
        self.addSubview(line)
    }
}
//MARK: -  add lower line
class linedTextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addLowerLine(withColor: UIColor.lightGray.withAlphaComponent(0.5))
    }
}


