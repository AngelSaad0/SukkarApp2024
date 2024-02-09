//
//  ValidMassage.swift
//  SukkarApp
//
//  Created by Engy on 2/3/2567 BE.
//

import Foundation
public enum ValidMassage: String {
   case none = ""
   case NameEmpty = "nameEmpty"
   case NameVaild =  "nameVaild"
   case EmailEmpty = "emailEmpty"
   case EmailValid = "emailValid"
   case PasswordEmpty = "passwordEmpty"
   case PasswordVaild =  "passwordVaild"
   case ReTypeEmpty = "reTypeEmpty"
   case ReTypeVaild = "reTypeVaild"
   case PasswordRetypeEqual = "passwordRetypeEqual"
   case MobileVaild = "mobileVaild"
   case MobileEmpty = "mobileEmpty"
   case TermsConditions = "termsConditions"
   case Succeses = "Succeses"
    var title: String {
         self.rawValue.localized
    }

}
