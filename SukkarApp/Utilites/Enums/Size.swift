//
//  Size.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//
//MARK: - enum size for font size
import Foundation
enum Size: Int{
    case size_5 = 5
    case size_10 = 10
    case size_11 = 11
    case size_12 = 12
    case size_13 = 13
    case size_14 = 14
    case size_15 = 15
    case size_16 = 16
    case size_17 = 17
    case size_18 = 18
    case size_19 = 19
    case size_20 = 20
    case size_21 = 21
    case size_22 = 22
    case size_23 = 23
    case size_24 = 24
    case size_25 = 25
    
    
    var xFactor: CGFloat {
        return CGFloat(self.rawValue)*iPhoneXFactor
    }
}

