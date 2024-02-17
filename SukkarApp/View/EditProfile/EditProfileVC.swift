//
//  EditProfileVC.swift
//  SukkarApp
//
//  Created by Engy on 1/5/2567 BE.
//

import UIKit
import Photos
import CoreData

class EditProfileVC: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet  var radiusView: [UIView]!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var editProfileLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfileData()
        initUI()
    }
    @IBAction func saveBtnClicked(_ sender: UIButton) {
        saveProfileData()
    }

    @IBAction func selectUserImageClicked(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true,completion: nil)

    }
}

// MARK: - HELPER

extension EditProfileVC {

    func initUI() {

        addNavBar(items: [.back, .menu, .notifaction], title: .editProfile)
        emailTxtField.customTxtField(placeholder: .emailTF)
        nameTxtField.customTxtField(placeholder: .nameTF)
        mobileTxtField.customTxtField(placeholder: .mobileTF)
        welcomeLbl.customLbl(text: .welcome)
        editProfileLbl.customLbl(text: .editProfileLbl)
        loginBtn.customBtn(titleColor: .C121212, font: .medium, size: .size_19, title: .save)
        loginBtn.addradiusBtn(radius: 7)
        for view in radiusView {
            view.addRadiusView(radius: 7)
        }
    }

    func saveProfileData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let mangeContext = appDelegate.persistentContainer.viewContext
        guard let userEntity = NSEntityDescription.entity(forEntityName: Kconstant.newUserRecord, in: mangeContext) else { return }
        let userData = NSManagedObject.init(entity: userEntity, insertInto: mangeContext)
        userData.setValue(nameTxtField.text, forKey: Kconstant.nameAttribute)
        userData.setValue(emailTxtField.text, forKey: Kconstant.emailAttribute)
        userData.setValue(mobileTxtField.text, forKey: Kconstant.mobileAttribute)
        do {
            try mangeContext.save()
            print("sucess mangeContext.save()")
        } catch {
            print(error.localizedDescription)
        }


    }

    func loadProfileData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        var mangeContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Kconstant.UserDataEntity)


    }

    func updateData() {

    }
    func deleteData() {

    }


}
// UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension EditProfileVC : UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: false)
        if let image = info[.editedImage] as? UIImage {
            userImage.image = image
            userImage.alpha = 0
            UIImageView.animate(withDuration: 1.5, animations: {
                self.userImage.alpha = 1 })
        }
    }


}
