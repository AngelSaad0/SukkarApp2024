//
//  MainTB.swift
//  SukkarApp
//
//  Created by amgad on 12/8/2566 BE.
//

import UIKit

class MainTB: UITabBarController {

    let notificationNme = NSNotification.Name("goToIndex1")

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        NotificationCenter.default.addObserver(self, selector: #selector(MainTB.NotificationGoToIndex1), name: notificationNme, object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.selectedIndex = 2
    }
    @objc func NotificationGoToIndex1() {
        print("NotificationGoToIndex1")
        self.selectedIndex = 1
    }
    func initUI() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.view.semanticContentAttribute = .forceLeftToRight

        let home = createTabBarItem(HomeVC(), img: "home_unsel")
        let catagories = createTabBarItem(CatagoriesVC(), img: "category_unsel")
        let offers = createTabBarItem(OffersVC(), img: "offers_unsel")
        let account = createTabBarItem(AccountVC(), img: "account_unsel")
        let vcs = [home, catagories, offers, account]
        self.setViewControllers(vcs, animated: false)
        tabBar.items?[0].title = VcTitle.home.rawValue.localized

    }
    private func createTabBarItem(_ vc: UIViewController, img: String) -> UINavigationController {
        let itemScene = UINavigationController(rootViewController: vc)
        itemScene.tabBarItem.image = UIImage(named: img)
        itemScene.tabBarItem.title = "مفيش حاجه بتحصل هنا"
        vc.view.semanticContentAttribute = .forceLeftToRight
        return itemScene

    }
}
