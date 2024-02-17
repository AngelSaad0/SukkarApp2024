//
//  Helper.swift
//  SukkarApp
//
//  Created by Engy on 12/31/2566 BE.
//

import Foundation
import SwiftMessages
import MOLH
public var screenWidth: CGFloat { get { return UIScreen.main.bounds.size.width } }
public var screenHeight:CGFloat { get { return UIScreen.main.bounds.size.height } }
public var iPhoneXFactor: CGFloat { get {return ((screenWidth * 1.00) / 414.0)} }

// RTL Language
func isEnglish() -> Bool{
 if MOLHLanguage.isRTLLanguage() { return false } else { return true }
}
 // Swift Messages
@MainActor public func displayMessage(massage: ValidMsg , isError: Bool) {
    let view = MessageView.viewFromNib(layout: .cardView)
    if isError == true {
        view.configureTheme(.error)
        view.alpha = 0.5
    } else {
        view.configureTheme(.success)
        view.alpha = 0.8
    }
    view.titleLabel?.isHidden = true
    view.bodyLabel?.text = massage.rawValue.localized
    view.titleLabel?.textColor = UIColor.white
    view.bodyLabel?.textColor = UIColor.white
    view.button?.isHidden = true
    view.alpha = 0.9
    var config = SwiftMessages.Config()
    config.presentationStyle = .bottom
    config.shouldAutorotate = true
    SwiftMessages.show(config: config, view: view)
}
// swift massages
@MainActor public func displayMessage(message: String, isError: Bool) {
    let view = MessageView.viewFromNib(layout: .cardView)
    if isError == true {
        view.configureTheme(.error)
        view.alpha = 0.5
    } else {
        view.configureTheme(.success)
        view.alpha = 0.8
    }
    view.titleLabel?.isHidden = true
    view.bodyLabel?.text = message
    view.titleLabel?.textColor = UIColor.white
    view.bodyLabel?.textColor = UIColor.white
    view.button?.isHidden = true
    view.alpha = 0.9
    var config = SwiftMessages.Config()
    config.presentationStyle = .bottom
    config.shouldAutorotate = true
    SwiftMessages.show(config: config, view: view)
}
// validation
func isValidEmail(_ email: String) -> Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: email)
}
func isValidMobile(_ mobileNumber: String) -> Bool {
    let mobileNumberRegex = "^\\d{11}$"
    let mobileNumberPredicate = NSPredicate(format: "SELF MATCHES %@", mobileNumberRegex)
    return mobileNumberPredicate.evaluate(with: mobileNumber)
}
func isValidName(_ name: String) -> Bool {
    let nameRegex = "^[a-zA-Z]{4,}$"
    let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
    return namePredicate.evaluate(with: name)
}
func isValidMobileOrEmail(_ input: String) -> Bool {
    let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let mobileNumberRegex = "^\\d{11}$"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    let mobileNumberPredicate = NSPredicate(format: "SELF MATCHES %@", mobileNumberRegex)
    return emailPredicate.evaluate(with: input) || mobileNumberPredicate.evaluate(with: input)
}
func isValidPassword(_ password: String) -> Bool {
    let passwordRegex = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return passwordPredicate.evaluate(with: password)
}




