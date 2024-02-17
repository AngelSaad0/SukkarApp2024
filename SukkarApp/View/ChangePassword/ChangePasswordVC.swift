//
//  ChangePasswordVC.swift
//  SukkarApp
//
//  Created by Engy on 1/5/2567 BE.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var radiusBtn: UIButton!
    @IBOutlet  var radiusView: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}
extension ChangePasswordVC {
    
    func initUI() {
        addNavBar(items: [.back, .menu, .notifaction], title: .changePass)
        radiusBtn.addradiusBtn(radius: 7)
        for view in radiusView {
            view.addRadiusView(radius: 7)
        }
    }
}
