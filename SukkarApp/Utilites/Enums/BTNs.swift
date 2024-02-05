//
//  BTNs.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import Foundation

// MARK: - BTNs Enum
enum BTNs: String {
    case NONE = ""
    case LOGIN = "loginBtn"
    case NEW_USER = "newUserBtn"
    case SAVE = "SaveBtn"
    case SEND = "SendBtn"
    case REGISTER = "RegisterBtn"
    case FORGET_PASSWORD = "forgetPasswordBtn"
    case GUEST = "guestBtn"
    case TERMS_CONDTIONS = "termsCondtionsBtn"
    
    var title: String {
         self.rawValue.localized
    }

}
