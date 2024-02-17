//
//  AddAddressesVC.swift
//  SukkarApp
//
//  Created by Engy on 1/5/2567 BE.
//

import UIKit

class AddAddressesVC: UIViewController {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var roundedBtn: UIButton!
    @IBOutlet weak var addressNameTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var areaTF: UITextField!
    @IBOutlet weak var blockTF: UITextField!
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var buildingTF: UITextField!
    @IBOutlet weak var paciNumberTF: UITextField!
    @IBOutlet weak var apartmentTF: UITextField!
    @IBOutlet weak var avenueTF: UITextField!
    @IBOutlet weak var floorTF: UITextField!
    @IBOutlet weak var adrressDetaildTF: UITextField!
    @IBOutlet weak var phonrNumberTF: UITextField!
    var selectedCounty: String?

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        initUI()
    }
    @IBAction func saveBtnClicked(_ sender: UIButton) {
    }
}
// MARK: - HELPER
extension AddAddressesVC {

    func initUI() {
        addNavBar(items: [.back, .menu, .notifaction], title: .addresses)
        roundedBtn.addroundedBtn(roundedBtn)
        roundedView.addRadiusView(radius: 10)
        roundedView.addBorderView(color: Color.CE2E2E2, width: 1)
    }
}

