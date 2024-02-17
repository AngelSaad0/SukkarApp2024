//
//  UIViewController+extension.swift
//  SukkarApp
//
//  Created by Engy on 12/9/2566 BE.
//

import UIKit
import SideMenu
extension UIViewController {

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
    func navBarAppearance(tintColor: Color, titleColor: Color) {
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
    func addNavBar(items: [NavBar] , title: VcTitle = .none) {
        var rightBtns: [UIBarButtonItem] = []
        var leftBtns: [UIBarButtonItem] = []
        for item in items {
            switch item {
            case .menu:
                rightBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.menu.rawValue), style: .plain, target: self, action: #selector(menuBtnClicked)))
            case .notifaction:
                rightBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.notification.rawValue), style: .plain, target: self, action: #selector(notifactionClicked)))
            case .location:
                rightBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.menu.rawValue), style: .plain, target: self, action: #selector(menuBtnClicked)))
            case .add:
                leftBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.menu.rawValue), style: .plain, target: self, action: #selector(menuBtnClicked)))
            case .back:
                leftBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.backArrow.rawValue), style: .plain, target: self, action: #selector(backBtnClicked)))
            case .video:
                leftBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.menu.rawValue), style: .plain, target: self, action: #selector(menuBtnClicked)))
            case .search:
                leftBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.menu.rawValue), style: .plain, target: self, action: #selector(menuBtnClicked)))
            case .logo:
                leftBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.splashLogo.rawValue), style: .plain, target: self, action: #selector(logoBtnClicked)))
            case .share:
                rightBtns.append(UIBarButtonItem(image: UIImage(named: NavBarImg.shareArrow.rawValue), style: .plain, target: self, action: #selector(menuBtnClicked)))
            }
            self.title = title.rawValue.localized
            self.navigationItem.rightBarButtonItems = rightBtns
            self.navigationItem.leftBarButtonItems = leftBtns
            self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
            self.navigationController?.navigationBar.scrollEdgeAppearance =  nil
            self.navigationController?.navigationBar.compactAppearance =  nil
            self.navigationController?.navigationBar.tintColor = UIColor(named: Color.C191919.rawValue)


        }
    }
    
    @objc
    func menuBtnClicked() {
        toSideMenu()
    }
    @objc
    func notifactionClicked() {
        print("notifaction")
    }

    @objc
    func backBtnClicked() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

    @objc
    func shareBtnClicked() {
        print("notifaction")
    }

    @objc
    func logoBtnClicked() {
        let notificationNme = NSNotification.Name("NotificationGoToIndex1")
        NotificationCenter.default.post(name: notificationNme, object: nil)
        print("logoBtnClicked")
    }

}
