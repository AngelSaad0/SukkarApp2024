//
//  UIColor+Extension.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }

        let color: UInt32 = 0
//        scanner.scanHexInt32(&color)
        scanner.currentIndex = hexString.startIndex


        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
//MARK: -
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
//MARK: -
extension Scanner {
    var scanLocation: Int? {
        get {
            for (offset, _) in string.enumerated() {
                let index = string.index(string.startIndex, offsetBy: offset)
                if index == currentIndex {
                    return offset
                }
            }

            return nil
        }
        set {
            guard let startValue = scanLocation, let newValue else { return }
            let delta = newValue - startValue
            var offset = 0
            while isAtEnd == false, offset != delta {
                currentIndex = string.index(currentIndex, offsetBy: delta > 0 ? 1 : -1)
                offset += delta > 0 ? 1 : -1
            }
        }
    }
}

