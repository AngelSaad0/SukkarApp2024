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
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var reTypePasswordTxtField: UITextField!
    @IBOutlet weak var iAgreeLbl: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var termsBtn: UIButton!
    @IBOutlet var cornerRaduisView: [UIView]!
    @IBOutlet weak var isAgreeImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    @IBAction func registerBtnClicked(_ sender: UIButton) {

        if validateRegisterFields() {
            getRegisterData()
            navigationController?.pushViewController(MainTB(), animated: true)
        }
    }

    @IBAction func agreeBtnClicked(_ sender: UIButton) {
        isAgree.toggle()
        isAgreeImg.image = UIImage(named: (isAgree) ? "check_sel" : "check_unsel")
    }
}

// MARK: -  Helper Extension

extension RegisterVC {

    func initUI() {
        addNavBar(items: [.back],title: .none)
        IQKeyboardManager.shared.enable = false
        initLocalizable()
        for view in cornerRaduisView {
            view.addRadiusView(radius: 7)
        }
    }

    func initLocalizable() {
        // Localizable button
        termsBtn.customBtn(titleColor: .C0079FB, title: .termsCondtions)
        registerBtn.customBtn(title: .register)
        iAgreeLbl.customLbl(text: .agreeFor)
        // Localizable txtFields
        nameTxtField.customTxtField(placeholder: .nameTF)
        emailTxtField.customTxtField(placeholder: .emailTF)
        phoneTxtField.customTxtField(placeholder: .mobileTF)
        reTypePasswordTxtField.customTxtField(placeholder: .rePasswordTF)
        passwordTxtField.customTxtField(placeholder: .passwordTF)
    }

   // get get Register Data
    func getRegisterData() {

        var customer: [String:Any] = [:]
        customer[kParameter.firstName] = nameTxtField.text ?? ""
        customer[kParameter.lastName] = nameTxtField.text ?? ""
        customer[kParameter.email] = emailTxtField.text ?? ""
        customer[kParameter.phone] = phoneTxtField.text ?? ""
        customer[kParameter.password] = passwordTxtField.text ?? ""
        customer[kParameter.roleIds] = [3]

        let parameters = [
            "customer": customer
            ]
        AF.request(Config.REGISTER, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseString { response in
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
                            let error = try JSONDecoder().decode(RegisterError.self, from: data)
                            print(error.errors?.email?.first ?? "")
                            displayMessage(message:error.errors?.email?.first ?? "", isError: true)

                        } catch let error { print(error) }
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
        if nameTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
            displayMessage(massage: .nameEmpty, isError: true)
            return false
        }
        if !isValidName(nameTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "") {
            displayMessage(massage: .nameVaild, isError: true)
            return false
        }
        // emailTextField
        if emailTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
            displayMessage(massage: .emailEmpty, isError: true)
            return false
        }
        if !isValidMobileOrEmail(emailTxtField.text?.trimmingCharacters(in: .whitespaces) ?? ""){
            displayMessage(massage: .emailValid, isError: true)
            return false
        }
        
        // mobileTextField
        if phoneTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
            displayMessage(massage: .mobileEmpty, isError: true)
            return false
        }
        if !isValidMobileOrEmail(phoneTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "") {
            displayMessage(massage: .mobileVaild, isError: true)
            return false
        }
        // passwordTextField
        if passwordTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
            displayMessage(massage: .passwordEmpty, isError: true)
            return false
        }
        //if !isValidPassword(passwordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "") {
//            displayMessage(massage: .PasswordVaild, isError: true)
//            return false
//        }
        // reTypePasswordTextField
        if reTypePasswordTxtField.text?.trimmingCharacters(in: .whitespaces) == "" {
            displayMessage(massage: .reTypeEmpty, isError: true)
            return false
        }
//        if !isValidPassword(reTypePasswordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "") {
//            displayMessage(massage: .ReTypeVaild, isError: true)
//            return false
//        }
        if !((passwordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "") == (reTypePasswordTxtField.text?.trimmingCharacters(in: .whitespaces) ?? "")) {
            displayMessage(massage: .passwordRetypeEqual, isError: true)
            return false
        }
        // is agree
        if !isAgree {
            displayMessage(massage: .termsConditions, isError: true)
            return false
        }
        return true
    }
}

