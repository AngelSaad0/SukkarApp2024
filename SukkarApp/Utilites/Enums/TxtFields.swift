//
//  TxtFields.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit
//MARK: - TxtFields Enum

enum TxtFields: String, CaseIterable {
    case NONE = ""
    case NAME = "nameTF"
    case EMAIL = "emailTF"
    case MOBILE = "mobileTF"
    case EMAIL_MOBILE = "emailMobileTF"
    case PASSWORD = "passwordTF"
    case RE_PASSWORD = "rePasswordTF"
    case MASSAGE = "massageTF"
    case OLD_PASSWORD = "oldPasswordTF"
    case NEW_PASSWORD = "newPasswordTF"
    case RE_NEW_PASSWORD = "reNewPasswordTF"
    var title: String {
         self.rawValue.localized
    }

}
