//
//  UINavigationController+Extension.swift
//  SukkarApp
//
//  Created by Engy on 12/9/2566 BE.
//

import UIKit
extension UINavigationController {
    func NavBarAppearance() {
        UINavigationBar.appearance().isTranslucent = false
        navigationController?.navigationBar.scrollEdgeAppearance =  nil
        navigationController?.navigationBar.compactAppearance =  nil

    }

}
