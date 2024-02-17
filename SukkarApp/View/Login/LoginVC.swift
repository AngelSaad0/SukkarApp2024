//
//  HomeVC.swift
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
    @IBOutlet weak var passwordTxtField :UITextField!
    @IBOutlet var cornerRaduisView: [UIView]!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet weak var forgetPassword: UIButton!
    @IBOutlet weak var continueAsLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    @IBAction func continueAsGuest(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("continueAsGuest"), object: nil)
        UserDefault.shared.continueAsAGuest = true
        UserDefault.shared.storeData()
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(MainTB(), animated: true)
    }

    @IBAction func loginBtnClicked(_ sender: UIButton) {
        if validateLoginFields() {
            getLoginData()
            displayMessage(massage: .succeses, isError: false)
//            UserDefault.shared.isLogin = true
//            UserDefault.shared.storeData()
            navigationController?.pushViewController(MainTB(), animated: true)
        }
    }
    
    @IBAction func registerBtnClicked(_ sender: UIButton) {
        navigationController?.pushViewController(RegisterVC(), animated: true)
    }
}

// MARK: - Helper Extension
extension LoginVC {

    func initUI() {

        localizable()
        loginBtn.addBackgroundAndRaduisBtn(backgroundColor: .C0079FB, raduis: 7)
        registerBtn.addBorderAndRaduisBtn(borderColor: .C0079FB, borderWith: 1, raduis: 7)
        for view in cornerRaduisView {
            view.addRadiusView(radius: 7)
        }
    }

    func localizable() {

        loginBtn.customBtn(title: .login )
        registerBtn.customBtn(title: .register)
        guestBtn.customBtn(titleColor: .C0079FB, title: .guest)
        forgetPassword.customBtn(titleColor: .C707070, title: .forgetPassword)
        continueAsLbl.customLbl(txtColor: .C707070, text: .continueAs)
        emailTxtField.customTxtField(placeholder: .emailTF)
        passwordTxtField.customTxtField(placeholder: .passwordTF)
    }

    func getLoginData() {

        let parameters = [
            kParameter.usernameOrEmail: emailTxtField.text ?? "",
            kParameter.password: passwordTxtField.text ?? ""
        ]
        AF.request(Config.LOGIN, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseString { response in
            switch response.result {
            case .success(let success):
                print(success)
                if let data = response.data, !data.isEmpty {
                    switch response.response?.statusCode {
                    case 200:
                        do {
                            let successData = try JSONDecoder().decode(Login.self, from: data)
                            let customerData = successData.customers?.first?.first_name ?? ""
                            displayMessage(message: "welcom \(customerData)", isError: false)
                        } catch let error {
                            displayMessage(message: error.localizedDescription, isError: true)
                        }
                    default:
                        do {
                            let errorData = try JSONDecoder().decode(LoginError.self, from: data)
                            print(errorData.errors?.customer?.first?.description ?? "")
                            displayMessage(message:errorData.errors?.customer?.first?.description ?? "", isError: true)
                        } catch let error { print(error) }
                    }
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

    func validateLoginFields() -> Bool {
        if emailTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
            displayMessage(massage: .emailEmpty, isError: true)
                return false
            }
            if !isValidMobileOrEmail(emailTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "") {
                displayMessage(massage: .emailValid, isError: true)
                return false
            }
            if passwordTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
                displayMessage(massage: .passwordEmpty, isError: true)
                return false
            }
//            if !isValidPassword(passwordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "") {
//                displayMessage(massage: .PasswordVaild, isError: true)
//                return false
//            }
            return true
        }
}
