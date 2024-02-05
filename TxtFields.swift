//
//  TxtFields.swift
//  
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit
//MARK: - TxtFields Enum

enum TxtFields: String, CaseIterable {
    
    case NONE = ""
    case EMAIL = "emailTF"
    case PHONE = "phoneTF"
    case PASSWORD = "passwordTF"
    case RE_PASSWORD = "rePasswordTF"
    
    var title: String {
         self.rawValue.localized
    }

}
