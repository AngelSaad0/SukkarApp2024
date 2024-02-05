//
//  CustomAlert.swift
//  SukkarApp
//
//  Created by Engy on 1/28/2567 BE.
//

import UIKit
struct CustomAlert {
    func aletBackgroundView(color:Colors,alpha:CGFloat = 0){
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(named: color.rawValue)
        backgroundView.alpha = alpha
       
    }
    
}
