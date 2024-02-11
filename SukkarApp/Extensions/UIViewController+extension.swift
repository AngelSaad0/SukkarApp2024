//
//  UIViewController+extension.swift
//  SukkarApp
//
//  Created by Engy on 12/9/2566 BE.
//

import UIKit
import SideMenu
extension UIViewController {
    // createNavTabBar
    func createTabBarItem(_ viewController: UIViewController, img: String, title: String) -> UINavigationController {
        let itemScene = UINavigationController(rootViewController: viewController)
        itemScene.tabBarItem.title = title
        itemScene.tabBarItem.image = UIImage(named: img)
        return itemScene
    }
    // Mange Navigation Bar
    func mangeNavigation(isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    // mange Tap Bar
    func mangeTapBar(isHidden: Bool) {
        tabBarController?.tabBar.isHidden = isHidden
        tabBarController?.tabBar.isTranslucent = isHidden
    }
    // dismissVC
    func dismissVC() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    // toSideMenu
    func toSideMenu() {
        let sideMenu = SideMenuNavigationController(rootViewController: SideMenuVC())
        sideMenu.menuWidth = CGFloat(UIScreen.main.bounds.width - 83)
        sideMenu.statusBarEndAlpha = 0
        sideMenu.alwaysAnimate = true
        sideMenu.isNavigationBarHidden  = true
        sideMenu.presentationStyle = .menuSlideIn
        sideMenu.presentationStyle.presentingEndAlpha = 0.5
        present(sideMenu, animated: true)
    }
    // toChartVC
    func toChartVC() {
        navigationController?.pushViewController(ChartVC(), animated: true)
    }
    // navationg Colors
    func navBarAppearance(tintColor: Colors, titleColor: Colors) {
        let tintColor = UIColor(named: tintColor.rawValue)
        let titleColor = UIColor(named: titleColor.rawValue) ?? .black
        UINavigationBar.appearance().tintColor = tintColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
    }
    // hideBackBtnName
    func hideBackBtnName() {
        navigationController?.navigationBar.topItem?.title = ""
    }
    // ADD NAV BAR
    func addNavigation(items: [NavBar], title: NavBarTitle) {
        var rightBarBtn: [UIBarButtonItem] = []
        var leftBarBtn: [UIBarButtonItem] = []
        for item in items {
            switch item {
            case .MENU:
                let img = UIImage(named: NavBarImg.menu.rawValue)
            case .LOGO:
                let img = UIImage(named: NavBarImg.menu.rawValue)
            case .ADD:
                let addImg = UIImage(named: NavBarImg.menu.rawValue)
            case .BACK:
                let img = UIImage(named: NavBarImg.menu.rawValue)
            case .VIDEO:
                let img = UIImage(named: NavBarImg.menu.rawValue)
            case .SEARCH:
                let img = UIImage(named: NavBarImg.menu.rawValue)
            case .NOTIFICATION:
                let img = UIImage(named: NavBarImg.menu.rawValue)
            case .LOCATION:
                let img = UIImage(named: NavBarImg.menu.rawValue)
            }
        }

    }
}
