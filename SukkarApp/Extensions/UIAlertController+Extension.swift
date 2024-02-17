//
//  UIAlert + Extensions.swift
//  SukkarApp
//
//  Created by Engy on 1/28/2567 BE.
//

import UIKit
extension UIAlertController {
//MARK: -
  
//MARK: -  //Set background color of UIAlertController

    func setAlertBackgroundColor(color: Color,alpha:CGFloat = 1,cornerRadius:CGFloat = 0) {
    if let backgroundView = self.view.subviews.first, let groupView = backgroundView.subviews.first, let contentView = groupView.subviews.first {
        contentView.backgroundColor = UIColor(named: color.rawValue)
        contentView.alpha = alpha
        contentView.layer.cornerRadius = cornerRadius
        }
    }
//MARK: - //Set title font and title color
    func setAlertTitle(font: Fonts, color: Color, size: Size) {
        guard let title = self.title else { return }
        let size = iPhoneXFactor*(CGFloat(size.rawValue))
        let font = UIFont(name: color.rawValue, size: size)
        let color = UIColor(named: color.rawValue)
        let attributeString = NSMutableAttributedString(string: title)
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : titleFont], range: NSMakeRange(0, title.utf8.count))
        }
        if let titleColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor], range: NSMakeRange(0, title.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedTitle")
    }
    
//MARK: - //Set message font and message color
    func setAlertMessage(font: Fonts, color: Color , size: Size) {
        guard let message = self.message else { return }
        let size = iPhoneXFactor*(CGFloat(size.rawValue))
        let font = UIFont(name: color.rawValue, size: size)
        let color = UIColor(named: color.rawValue)
        
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : messageFont],
                                          range: NSMakeRange(0, message.utf8.count))
        }

        if let messageColorColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : messageColorColor],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedMessage")
    }

//MARK: - //Set tint color of UIAlertController
    func setAlertTint(color: Color) {
        self.view.tintColor = UIColor(named: color.rawValue)
    }
}


