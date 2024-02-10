//
//  RegisterVC.swift
//  SukkarApp
//
//  Created by Engy on 12/5/2566 BE.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift

class RegisterVC: UIViewController {
    
    var isAgree = false
    var navBar: KHNavBar!
    
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var reTypePasswordTxtField: UITextField!
    @IBOutlet weak var iAgreeLbl: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var termsBtn: UIButton!
    @IBOutlet var cornerRaduisView:[UIView]!
    @IBOutlet weak var isAgreeImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
        
    }

    //register Button
    @IBAction func registerBtnClicked(_ sender: UIButton) {
       
        if validateRegisterFields(){
            getRegisterData()
            let vc:UIViewController = MainTB()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    //agree for Button
    @IBAction func agreeBtnClicked(_ sender: UIButton) {
        isAgree.toggle()
        isAgreeImg.image = UIImage(named: (isAgree) ? "check_sel" : "check_unsel")
    }
    
}

//MARK: -  Helper Extension
extension RegisterVC{
    //initUI
    func initUI(){
        //arange in calling fun required for initLocalizable & initDesing
        IQKeyboardManager.shared.enable = false
        initLocalizable()
        initDesing()
        customDesindForAR()
        //initNavBar()
    }
    
    //init Desing
    func initDesing(){
        for view in cornerRaduisView{
            view.addRadiusView(radius: 7)
        }
    }
    
    //init NavBar
    func initNavBar() {
   //        navBar = KHNavBar.initView(vc: self, andView: khNavBarView, title: .Home, withShape: .withNoti, isVarTitle: false, withShadow: true, back: .dismiss)
    }
    
    //Localizable
    func initLocalizable(){
        //button
        termsBtn.customBtn(titleColor: .C0079FB, title: .TERMS_CONDTIONS)
        registerBtn.customBtn(title: .REGISTER)
        iAgreeLbl.customLbl(text:.AGREE_FOR)

        //Localizable txtFields
        nameTxtField.customTxtField(placeholder: .NAME)
        emailTxtField.customTxtField(placeholder: .EMAIL)
        mobileTxtField.customTxtField(placeholder: .MOBILE)
        reTypePasswordTxtField.customTxtField(placeholder: .RE_PASSWORD)
        passwordTxtField.customTxtField(placeholder: .PASSWORD)
    }
    
    //custom Desind For ARABIC
    func customDesindForAR(){
        termsBtn.btnTxtColorInArbaic(txtColorAR: .C231F1F)
    }

    //get get Register Data
    func getRegisterData(){
       
    }
    
    // validateRegisterFields
    func validateRegisterFields() -> Bool {
        
        //nameTextField
        if nameTxtField.text?.trimmingCharacters(in: .whitespaces) == ""{
            displayMessage(message: .NameEmpty, isError: true)
            return false
        }
        if !isValidName(nameTxtField.text?.trimmingCharacters(in: .whitespaces) ?? ""){
            displayMessage(message:.NameVaild, isError: true)
            return false
        }
        
        //emailTextField
        if emailTxtField.text?.trimmingCharacters(in: .whitespaces) == ""{
            displayMessage(message: .EmailEmpty, isError: true)
            return false
        }
        if !isValidMobileOrEmail(emailTxtField.text?.trimmingCharacters(in: .whitespaces) ?? ""){
            displayMessage(message:.EmailValid, isError: true)
            return false
        }
        
        //mobileTextField
        if mobileTxtField.text?.trimmingCharacters(in: .whitespaces) == ""{
            displayMessage(message:.MobileEmpty, isError: true)
            return false
            
        }
        if !isValidMobileOrEmail(mobileTxtField.text?.trimmingCharacters(in: .whitespaces) ?? ""){
            displayMessage(message: .MobileVaild, isError: true)
            return false
        }
        
        //passwordTextField
        if passwordTxtField.text?.trimmingCharacters(in: .whitespaces) == ""{
            displayMessage(message:.PasswordEmpty, isError: true)
            return false
            
        }
        if !isValidPassword(passwordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? ""){
            displayMessage(message:.PasswordVaild, isError: true)
            return false
        }
        
        //reTypePasswordTextField
        if reTypePasswordTxtField.text?.trimmingCharacters(in: .whitespaces) == ""{
            displayMessage(message:.ReTypeEmpty, isError: true)
            return false
        }
        if !isValidPassword(reTypePasswordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? ""){
            displayMessage(message:.ReTypeVaild, isError: true)
            return false
        }
        if !((passwordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "") == (reTypePasswordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "")){
            displayMessage(message: .PasswordRetypeEqual, isError: true)
            return false
        }
        //is agree
        if !isAgree {
            displayMessage(message:.TermsConditions, isError: true)
            return false
        }
        
        
        return true
    }
}

