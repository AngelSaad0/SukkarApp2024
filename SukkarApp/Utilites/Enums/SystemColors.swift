//
//  DesignSystemColor.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit
enum SystemColors {
    typealias RawValue = UIColor
    //Semantic colors
    //Neutral colors
    case primary
    case secondary
    case background
    case accent
    
    //text
    case primaryTxt
    case secondaryTxt
    case primaryTxtBackground
    case secondaryTxtBackground
    
    //buttons
    case primaryBtn
    case secondaryBtn
    case primaryBtntBackground
    case secondaryBtnBackground
   
    //navBar
    case navBackground
    case navTint
    
    //title
    case primaryTitle
    case secondaryTitle
    case primaryTitleBackground
    case secondaryTitleBackground
}
extension SystemColors {
    var rawValue: UIColor {
        get {
            switch self {
            case .primary:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .secondary:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .background:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .accent:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .primaryTxt:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .secondaryTxt:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .primaryTxtBackground:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .secondaryTxtBackground:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .primaryBtn:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .secondaryBtn:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .primaryBtntBackground:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .secondaryBtnBackground:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .navBackground:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .navTint:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .primaryTitle:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .secondaryTitle:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .primaryTitleBackground:
                return UIColor(named: Colors.C0079FB.rawValue)!
            case .secondaryTitleBackground:
                return UIColor(named: Colors.C0079FB.rawValue)!
            }
        }
    }
}



//extension SystemColors:RawRepresentable {
//    init?(rawValue: UIColor) {
//        switch rawValue {
//            
//        case UIColor(named: Colors.C0079FB.rawValue): self = .primary
//        case UIColor(named: Colors.C0079FB.rawValue): self = .secondary
//        case UIColor(named: Colors.C0079FB.rawValue): self = .accent
//        case UIColor(named: Colors.C0079FB.rawValue): self = .background
//        default: return nil
//                }
//    }
//    
//    var rawValue: UIColor {
//        var rawValue: RawValue {
//                switch self {
//                case .primary: return UIColor(named: Colors.C0079FB.rawValue)!
//                case .secondary: return UIColor(named: Colors.C0079FB.rawValue)!
//                case .accent: return UIColor(named: Colors.C0079FB.rawValue)!
//                case .background: return UIColor(named: Colors.C0079FB.rawValue)!
//                }
//            }
//        return rawValue
//
//    }
//    
//    
//}
