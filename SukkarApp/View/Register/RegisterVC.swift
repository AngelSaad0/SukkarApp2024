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
        var customer : [String: Any] = [:]
        customer[K.first_name] = nameTxtField.text ?? ""
        customer[K.last_name] = nameTxtField.text ?? ""
        customer[K.email] = emailTxtField.text ?? ""
        customer[K.phone] = mobileTxtField.text ?? ""
        customer[K.date_of_birth] = ""
        customer[K.gender] = "M"
        customer[K.password] = passwordTxtField.text ?? ""
        customer[K.role_ids] = [3]
        let parameters = [
            "customer": customer
        ]
        //1.URL 2.Method 3.parameters 4.encoding 5.headers
        
        AF.request(Config.LOGIN, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseString { response in
            switch response.result {
             case .success(let success):
                print(success)
                if let data = response.data , !data.isEmpty {
                    switch response.response?.statusCode {
                    case 200:
                        do{
                            let successData = try JSONDecoder().decode(Login.self, from: data)
                            let successMsg = successData.customers?.first?.first_name ?? ""
                            print(successMsg)
                            displayMessage(message:.Succeses, isError: false)
                        }catch let error {
                            print(error)
                        }
                    default:
                        do{
                            let errorData = try JSONDecoder().decode(RegisterError.self, from: data)
                            let errorMsg = errorData.errors?.email?.first ?? ""
                            displayMessage(message:.EmailValid, isError: false)
                           
                        } catch let error {
                            print(error)
                        }
                       
                    }
                 
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
        
        
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

