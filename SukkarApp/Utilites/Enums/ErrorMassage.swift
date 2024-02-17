//
//  ErrorMassage.swift
//  SukkarApp
//
//  Created by Engy on 2/12/2567 BE.
//

import Foundation
public enum ErrorMassage: String {
    case none = ""
    case usernameOrEmail = "username_or_email"
    case password = "password"
    case firstName  =  "first_name"
    case lastName = "last_name"
    case email =  "email"
    case phone = "phone"
    case dateOfBirth =  "date_of_birth"
    case gender =  "gender"
    case roleIds = "role_ids"

     var title: String {
          self.rawValue.localized
     }


}
