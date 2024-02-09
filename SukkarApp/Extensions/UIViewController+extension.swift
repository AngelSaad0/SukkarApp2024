//
//  UIViewController+extension.swift
//  SukkarApp
//
//  Created by Engy on 12/9/2566 BE.
//

import UIKit
import SideMenu
extension UIViewController{
    //MARK: - Create alert controller 
   public func creatAlertController(title:String, message:String,actionBtnTitle:String,cancelBtnTitle:String,placholder:String,style:UIAlertController.Style){
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            
            let actionBtn = UIAlertAction(title: actionBtnTitle, style: .default) { action in
                actionHandler()
            }
            let cancelBtn = UIAlertAction(title: cancelBtnTitle, style: .default) { action in
                cancelHandler()
            }
            alertController.addAction(actionBtn)
            alertController.addAction(cancelBtn)
            present(alertController, animated: true, completion: nil)
            func actionHandler(){
         
            }
           func cancelHandler(){
                
            }
            
        }
      
//MARK: - createNavTabBar
        func createNavTabBar(vc:UIViewController,image:String,title:String) -> UINavigationController{
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.title = title
            nav.tabBarItem.image = UIImage(named: image)
            return nav
        }
//MARK: -  Mange Navigation Bar
      func mangeNavigation(isHidden: Bool){
          navigationController?.setNavigationBarHidden(isHidden, animated: true)
      }
    
//MARK: -  mange Tap Bar
      func mangeTapBar(isHidden:Bool){
          tabBarController?.tabBar.isHidden = isHidden
          tabBarController?.tabBar.isTranslucent = isHidden
      }
    
//MARK: -  dismissVC
      func dismissVC(){
          navigationController?.popViewController(animated: true)
          dismiss(animated: true)
      }
    
//MARK: -  navigation To anther screen

    func navigationTo(vc:UIViewController){
        let vc = vc
        navigationController?.pushViewController(vc, animated: true)
    }
    
//MARK: -  toSideMenu
      func toSideMenu(){
          let vc = SideMenuVC()
          let sideMenu = SideMenuNavigationController(rootViewController: vc)
          sideMenu.menuWidth = CGFloat(UIScreen.main.bounds.width - 83)
          sideMenu.statusBarEndAlpha = 0
          sideMenu.alwaysAnimate = true
          sideMenu.isNavigationBarHidden  = true
          sideMenu.presentationStyle = .menuSlideIn
          sideMenu.presentationStyle.presentingEndAlpha = 0.5
          present(sideMenu, animated: true)
      }
    
//MARK: -  toChartVC
    func toChartVC(){
        let vc = ChartVC()
        navigationController?.pushViewController(vc, animated: true)
       
    }
    
//MARK: - navationg COLors
    func navBarAppearance(tintColor:Colors,titleColor:Colors){
       
        //UINavigationBar.appearance().barTintColor = UIColor(red: 234.0/255.0, green: 46.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor(named:tintColor.rawValue)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor :UIColor(named:titleColor.rawValue) ?? .black]
    }
    func hideBackBtnName(){
        navigationController?.navigationBar.topItem?.title = ""
    }
        //MARK: -  ADD NAV BAR
    func addNavigation(items: [NAV_BAR], isFromNotification: Bool = false) {
        
        var itemList: [NAV_BAR] = items
        if isFromNotification{
            
        }else{
            itemList.append(.NOTIFICATION)
        }

//        if #available(iOS 13.0, *) {
//            let textAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.Medium.rawValue.localized, size: CGFloat(CGFloat(Size.size_18.rawValue)*iPhoneXFactor))!,NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor(hexString: Colors.CFFFFFF.rawValue)]
//
//            let appearance = UINavigationBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = UIColor(hexString: Colors.C000000.rawValue)
//            appearance.titleTextAttributes = [.foregroundColor: UIColor(hexString: Colors.CFFFFFF.rawValue)]
//            appearance.titleTextAttributes = textAttributes
//            self.navigationController?.navigationBar.standardAppearance = appearance
//            self.navigationController?.navigationBar.compactAppearance = self.navigationController?.navigationBar.standardAppearance
//        } else {
           // // Fallback on earlier versions
//            let textAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.Medium.rawValue.localized, size: CGFloat(CGFloat(Size.size_18.rawValue)*iPhoneXFactor))!,NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor(hexString: Colors.CFFFFFF.rawValue)]
//            navigationController?.navigationBar.titleTextAttributes = textAttributes
//        }

        
        var rightArray: [UIBarButtonItem] = []
        var leftArray: [UIBarButtonItem] = []
//        let contentView = UIView()
        for item in itemList{
            switch item {
            case .MENU: rightArray.append(UIBarButtonItem(image: UIImage(named: Images.MENU.rawValue)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuBtnClicked)))
            case .ADD: leftArray.append(UIBarButtonItem(image: UIImage(named: "add_archive")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(addArchiveClicked)))

            case .BACK: leftArray.append(UIBarButtonItem(image: UIImage(named: Images.BACK.rawValue)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backBtnClicked)))
            case .LOGO:
                let menuLog = UIImage.init(named: Images.MENU_LOGO.rawValue)
                let logoImageView = UIImageView.init(image: menuLog)
                logoImageView.frame = CGRect(x:0.0,y:0.0, width: (45.5*iPhoneXFactor),height: (47*iPhoneXFactor))
                //logoImageView.contentMode = .scaleAspectFit
                let imageItem = UIBarButtonItem.init(customView: logoImageView)
                leftArray.append(imageItem)
                
            case .LOCATION: leftArray.append(UIBarButtonItem(image: UIImage(named: "location_white")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(locationBtnClicked)))

            case .VIDEO: rightArray.append(UIBarButtonItem(image: UIImage(named: Images.VIDEO.rawValue)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(videoBtnClicked)))

            case .SEARCH: rightArray.append(UIBarButtonItem(image: UIImage(named: "bar_search_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(searchBtnClicked)))
                
            case .NOTIFICATION: rightArray.append(UIBarButtonItem(image: UIImage(named: "bell")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(NotificationBtnClicked)))

            }
        }
        self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: Colors.C000000.rawValue)
        self.navigationItem.rightBarButtonItems = rightArray
        self.navigationItem.leftBarButtonItems = leftArray
        self.navigationItem.hidesBackButton = true
    }
    //MARK: - محتاجه فهم
    
    
    func addLeftBarLogo(named:String) {
        let imageHeight = screenWidth * 0.139
        let imageWidth = imageHeight * 2.34
        let logoImage = UIImage.init(named: named)
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x:0.0,y:0.0, width: imageWidth,height: imageHeight)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        navigationItem.leftBarButtonItem =  imageItem
    }
    
  
    @objc
    func videoBtnClicked(){
    }
    
    @objc
    func searchBtnClicked(){
        print("search")
    }
    
    @objc
    func NotificationBtnClicked(){
        print("notifications")
       // let vc = NotificationsViewController()
        
        //navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func locationBtnClicked(){
        print("notifications")
//        let vc = GroupMembersVC()
//        vc.isFromLocation = true
//        vc.roomId = 0
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func menuBtnClicked(){
       // presedntMenu()
    }
    
    @objc
    func backBtnClicked(){
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
        func addArchiveClicked(){

        }
    
   
    
    
        
    }
