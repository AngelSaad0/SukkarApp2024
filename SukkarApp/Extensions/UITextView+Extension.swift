//
//  UITextView+Extension.swift
//  SukkarApp
//
//  Created by Engy on 1/8/2567 BE.
//

import UIKit
extension UITextView {
    func adjustUITextViewHeight() {
            self.translatesAutoresizingMaskIntoConstraints = true
            self.sizeToFit()
            self.isScrollEnabled = false
        }
    
}
