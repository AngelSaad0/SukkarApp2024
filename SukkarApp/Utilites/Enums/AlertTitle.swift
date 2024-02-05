//
//  AlertTxt.swift
//  SukkarApp
//
//  Created by Engy on 1/28/2567 BE.
//

import Foundation
enum AlertTitle: String {
    case NewAddress = "newAddress"
    
    var title: String {
         self.rawValue.localized
    }
}
