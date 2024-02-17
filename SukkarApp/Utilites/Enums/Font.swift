//
//  Font.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import Foundation
enum Fonts: String {
    case black = "BlackFont"
    case bold = "BoldFont"
    case extraBold = "ExtraBoldFont"
    case light = "LightFont"
    case medium = "MediumFont"
    case regular = "RegularFont"
    case semiBold = "SemiBold"
    var font: String {
        return self.rawValue.localized
    }


}
