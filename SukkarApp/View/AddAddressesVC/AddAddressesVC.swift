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
    var selectedCounty:String?
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
             initUI()
       
       
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func saveBtnClicked(_ sender: UIButton) {
    }
    
  
    

}



extension AddAddressesVC{
    func initUI(){
//        //countryTF.isUserInteractionEnabled = true
//        createCountryPicker()
        
        roundedBtn.addroundedBtn(roundedBtn)
        roundedView.addRadiusView(radius: 10)
        roundedView.addBorderView(color: Colors.CE2E2E2, width: 1)
    }
}


extension AddAddressesVC{
    func createCountryPicker(){
       // let picker =  CountryPicker()
//        picker.countryPickerDelegate = self
//        picker.showPhoneNumbers = true
        //countryTF.inputView = picker
//        picker.selectRow(0, inComponent: 0, animated: true)
        
    }
}


//extension AddAddressesVC: CountryPickerDelegate{
//    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
//        //countryTF.text = name
//    }
    
     
    
//}







