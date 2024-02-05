//
//  lbls.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import Foundation
enum Lbls: String{
    case NONE = ""
    case WELCOME = "welcomeLbl"
    case CONTINUE_AS = "continueAsLbl"
    case AGREE_FOR = "agreeForLbl"
    
    
    var title: String {
        return self.rawValue.localized
    }
}
