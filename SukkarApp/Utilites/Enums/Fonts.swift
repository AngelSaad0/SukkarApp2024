//
//  Fonts.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import Foundation
        enum Fonts: String{
            case Black = "BlackFont"
            case Bold = "BoldFont"
            case ExtraBold = "ExtraBoldFont"
            case Light = "LightFont"
            case Medium = "MediumFont"
            case Regular = "RegularFont"
            case SemiBold = "SemiBold"
            var font: String {
                return self.rawValue.localized
            }
 
  
}
