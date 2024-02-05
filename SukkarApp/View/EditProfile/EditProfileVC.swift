//
//  EditProfileVC.swift
//  SukkarApp
//
//  Created by Engy on 1/5/2567 BE.
//

import UIKit

class EditProfileVC: UIViewController {
    
@IBOutlet weak var welcomeLbl: UILabel!
@IBOutlet weak var loginBtn: UIButton!
//@IBOutlet weak var emailTxtField: UITextField!
@IBOutlet  var radiusView: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        mangeNavigation(isHidden: false)
    }
}

extension EditProfileVC {
    func initUI() {
        welcomeLbl.customLbl(txtColor: .C707070, size: .size_20, font: .Bold,text: .WELCOME)
        loginBtn.customBtn(titleColor: .C121212, font: .Medium, size: .size_19, title: .SAVE)
        loginBtn.addradiusBtn(radius: 7)
        
        for view in radiusView {
            view.addRadiusView(radius: 7)
        }
    }
}
