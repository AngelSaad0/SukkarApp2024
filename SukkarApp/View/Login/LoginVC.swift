//
//  HomeVC.swift
//  Coffee Club
//
//  Created by Engy on 12/4/2566 BE.
//

import UIKit
import Alamofire
import SwiftyJSON
import CLTypingLabel
import IQKeyboardManagerSwift
class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet var cornerRaduisView:[UIView]!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet weak var forgetPassword:UIButton!
    @IBOutlet weak var continueAsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        IQKeyboardManager.shared.enable = false
    }
    
    //continue As Guest button
    @IBAction func continueAsGuest(_ sender: Any) {
        UserDefault.shared.continueAsAGuest = true
        UserDefault.shared.storeData()
        navigationController?.pushViewController(MainTB(), animated: true)
    }
    
    //login button
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        if validateLoginFields(){
            getLoginData()
            displayMessage(message:.Succeses, isError: false)
                UserDefault.shared.isLogin = true
                UserDefault.shared.storeData()
            
        }
    }
    
    // register button
    @IBAction func registerBtnClicked(_ sender: UIButton){
        let vc:UIViewController  = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


//MARK: - Helper Extension
extension LoginVC{
    
    //init ui
    func initUI(){
        //arange in calling fun required for initLocalizable & customDesindForAR
        initLocalizable()
        customDesindForAR()
        initDesing()
        initNavBar()
    }
    
    //init Desing
    func initDesing(){
        loginBtn.addBackgroundAndRaduisBtn(backgroundColor: .C0079FB, raduis: 7)
        registerBtn.addBorderAndRaduisBtn(borderColor: .C0079FB, borderWith: 1, raduis: 7)
        for view in cornerRaduisView{
            view.addRadiusView(radius: 7)
        }
    }
    
    //init NavBar
    func initNavBar() {
        addNavigation(items: [.VIDEO, .BACK])
    }
    
    //Localizable
    func initLocalizable(){
        loginBtn.customBtn(title: .LOGIN )
        registerBtn.customBtn(title: .REGISTER)
        guestBtn.customBtn(titleColor: .C0079FB, title: .GUEST)
        forgetPassword.customBtn(titleColor:.C707070, title: .FORGET_PASSWORD)
        continueAsLbl.customLbl(txtColor: .C707070 ,text:.CONTINUE_AS)
        emailTxtField.customTxtField(placeholder: .EMAIL)
        passwordTxtField.customTxtField(placeholder: .PASSWORD)
        
    }
    
    //custom Desind For ARABIC
    func customDesindForAR(){
        guestBtn.btnTxtColorInArbaic(txtColorAR: .C212121)
    }
    
    //getLoginData
    func getLoginData(){
        let email = emailTxtField.text ?? ""
        let password = passwordTxtField.text ?? ""
        
        let parameters = [
            K.username_or_email:email,
            K.password:password
        ]
        
        //1.URL 2.Method 3.parameters 4.encoding 5.headers
        
        AF.request(Config.LOGIN, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseString { response in
            switch response.result {
                
            case .success(let success):
                print(success)
                if let data = response.data , !data.isEmpty {
                    switch response.response?.statusCode {
                    case 200:
                        do{
                            let successData = try JSONDecoder().decode(Login.self, from: data)
                            displayMessage(msgString: "welcome", isError:false )
                           
                        }catch let error {
                            print(error)
                        }
                        
                    default:
                        do{
                            let errorData = try JSONDecoder().decode(LoginError.self, from: data)
                           
                            
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
   //validate Login Fields
    func validateLoginFields()-> Bool{
        if emailTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
            displayMessage(message:.EmailEmpty, isError: true)
                return false
            }
            if !isValidMobileOrEmail(emailTxtField.text?.trimmingCharacters(in: .whitespaces) ?? ""){
                displayMessage(message:.EmailValid, isError: true)
                return false
            }
            if passwordTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
                displayMessage(message:.PasswordEmpty, isError: true)
                return false
            }
            if !isValidPassword(passwordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? ""){
                displayMessage(message:.PasswordVaild, isError: true)
                return false
            }
            return true
        }
    

}
    
