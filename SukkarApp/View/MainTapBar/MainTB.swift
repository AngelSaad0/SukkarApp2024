//
//  MainTB.swift
//  SukkarApp
//
//  Created by amgad on 12/8/2566 BE.
//

import UIKit

class MainTB: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //mangeNavigation(isHidden: true)
        setupTabItems()
        setUpBarButtons()
    }
    @objc func sideMenuBtnClicked() {
        toSideMenu()
    }
    @objc func chartBtnClicked(){
        toChartVC()
    }
}

//MARK: - SETUP TABS & CREATE NavigationController
extension MainTB{
    private func setupTabItems(){
        let home = self.createTabBarItem(HomeVC(),img:"home_unsel",title:"Home")
        let catagories = self.createTabBarItem(CatagoriesVC(),img:"category_unsel", title:"catagories")
        let offers  = self.createTabBarItem(OffersVC(),img:"offers_unsel",title:"offers")
        let account = self.createTabBarItem(AccountVC(),img:"account_unsel",title:"account")
        let vcs = [home,catagories,offers,account]
        self.setViewControllers(vcs, animated: true)
        
    }
    private func setUpBarButtons(){
        let sideMenue = UIBarButtonItem(image:UIImage(named: "side_menu"), style: .plain, target: self, action: #selector(sideMenuBtnClicked))
        sideMenue.tintColor = UIColor(named: Colors.C231F1F.rawValue)
        let chart =  UIBarButtonItem(image:UIImage(named: "cart"), style: .plain, target: self, action: #selector(chartBtnClicked))
        chart.tintColor = UIColor(named: Colors.C231F1F.rawValue)
        navigationItem.rightBarButtonItems = [sideMenue,chart]
        
    }
}
//MARK: - UITabBarControllerDelegate
extension MainTB :UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        
       
    }
    
}






//        UINavigationBar.appearance().standardAppearance = UINavigationBarAppearance()
//        UINavigationBar.appearance().compactAppearance = UINavigationBarAppearance()
//        UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
//        UITabBar.appearance().standardAppearance = UITabBarAppearance()
//        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        
