//
//  NavBar.swift
//  Flora
//
//  Created by Ahmed Abuelmagd on 12/28/19.
//  Copyright © 2019 Ahmed Abuelmagd. All rights reserved.
//

import UIKit
import SideMenu

protocol UserProfileDelegate: NSObjectProtocol {
    func userProfileBtnClicked()
}
protocol AddBtnDelegate: NSObjectProtocol {
    func addBtnClicked()
}
protocol VideoCallDelegate: NSObjectProtocol {
    func videoCallBtnClicked()
}
protocol BackDelegate: NSObjectProtocol {
    func backBtnClicked()
}

class KHNavBar: UIView {
    // MARK: - Variables & Constants
    var parentVC: UIViewController!
    
    weak var userProfileBtnClicked: UserProfileDelegate?
    weak var addBtnDelegate: AddBtnDelegate?
    weak var videoCallDelegate: VideoCallDelegate?
    weak var backDelegate: BackDelegate?
    //var backAction: BACK?
    // MARK: - Outlets
    // Views
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var chatAddView: UIView!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var logoImgView: UIImageView!
    
    
//MARK: - Functions
    public static func initView(vc controller: UIViewController, andView view: UIView, title: VcTitle, withShape shape: NavBar, isVarTitle: Bool, varTitle: String = "", withShadow: Bool, back: BACK) -> KHNavBar {
        let popup = Bundle.main.loadNibNamed("KHNavBar", owner: controller, options: nil)?.last as! KHNavBar
        popup.parentVC = controller
        //popup.backAction = back
//        popup.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.size.height)
//        
//        if withShadow{
//            popup.buttomShadow(view: popup.containerView)
//        }
        popup.setupIsTitle(isVarTitle: isVarTitle, varTitle: varTitle, title: title)
//        switch shape {
//        case .home: popup.initHomeCase()
//        case .tabBar: popup.initTabBarCase()
//        case .withNoti: popup.initWithNotiCase()
//        case .plus: popup.initPlusCase()
//        case .withoutNoti: popup.initWithoutNotiCase()
//        case .chat: popup.initChatCase()
//        case .oldChat: popup.initOldChatCase()
//        case .doctorChat: popup.initDoctorChatCase()
//        }
        view.addSubview(popup)
        return popup
    }
    // MARK: - Actions
    @IBAction func videoCallBtnClicked(_ sender: UIButton) {
        videoCallDelegate?.videoCallBtnClicked()
    }
    @IBAction func notificationsBtnClicked(_ sender: UIButton) {
        //parentVC.navigationController?.pushViewController(NotificationsVC.create(), animated: true)
    }
    @IBAction func menuBtnClicked(_ sender: UIButton) {
        //presedntMenu()
    }
    @IBAction func backBtnClicked(_ sender: UIButton) {
        print("dfghjhddjhdhhg===gggg")
//        switch backAction{
//        case .dismiss:
//            parentVC.navigationController?.popViewController(animated: true)
//            parentVC.dismiss(animated: true, completion: nil)
//        case .goToTabbar:
//            pushToView(withId: IDENTIDIERS.TAB_BAR.rawValue, stroyBorad: STORYBOARDS.MAIN.rawValue, options: .allowAnimatedContent)
//        case .freeAction:
//            backDelegate?.backBtnClicked()
//        case .none:
//            print("none")
//        }
    }
    @IBAction func userProfileBtnClicked(_ sender: UIButton) {
        userProfileBtnClicked?.userProfileBtnClicked()
    }
    @IBAction func addBtnClicked(_ sender: UIButton) {
        addBtnDelegate?.addBtnClicked()
    }
    
}

// MARK: - helpers
extension KHNavBar {
    func initHomeCase() {
        videoView.isHidden = true
        chatAddView.isHidden = true
        addView.isHidden = true
        backView.isHidden = true
        titleLbl.isHidden = true
    }
    func initTabBarCase() {
        videoView.isHidden = true
        chatAddView.isHidden = true
        addView.isHidden = true
        backView.isHidden = true
        logoImgView.isHidden = true
    }
    func initWithNotiCase() {
        videoView.isHidden = true
        chatAddView.isHidden = true
        addView.isHidden = true
        logoImgView.isHidden = true
    }
    func initPlusCase() {
        videoView.isHidden = true
        chatAddView.isHidden = true
        addView.isHidden = false
        logoImgView.isHidden = true
        notificationView.isHidden = false
        menuView.isHidden = false
    }
    func initWithoutNotiCase() {
        videoView.isHidden = true
        chatAddView.isHidden = true
        addView.isHidden = true
        logoImgView.isHidden = true
        notificationView.isHidden = true
    }
    func initOldChatCase(){
        videoView.isHidden = true
        chatAddView.isHidden = true
        addView.isHidden = true
        logoImgView.isHidden = true
        notificationView.isHidden = true
        menuView.isHidden = true
    }
    func initChatCase() {
        videoView.isHidden = false
        chatAddView.isHidden = true
        addView.isHidden = true
        logoImgView.isHidden = true
        notificationView.isHidden = true
        menuView.isHidden = true
    }
    func initDoctorChatCase() {
        videoView.isHidden = false
        chatAddView.isHidden = false
        addView.isHidden = true
        logoImgView.isHidden = true
        notificationView.isHidden = true
        menuView.isHidden = true
    }
    func setupIsTitle(isVarTitle: Bool, varTitle: String, title: VcTitle) {
       // titleLbl.adjustDynamicSize(text: isVarTitle ? varTitle : title.rawValue.localized, font: , size: ._42, direction: .Center)
    }
}
