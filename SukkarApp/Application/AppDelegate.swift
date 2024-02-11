//
//  AppDelegate.swift
//  Coffee Club
//
//  Created by amgad on 12/4/2566 BE.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds)
        if UserDefault.shared.continueAsAGuest || UserDefault.shared.isLogin {
            window?.rootViewController = UINavigationController(rootViewController:LoginVC())
        } else{
            window?.rootViewController = UINavigationController(rootViewController:LoginVC())
        }
        window?.makeKeyAndVisible()
        return true
    }
}


   







