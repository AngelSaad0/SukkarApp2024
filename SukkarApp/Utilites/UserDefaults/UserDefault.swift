//
//  UserDefault.swift
//  SukkarApp
//
//  Created by Engy on 12/31/2566 BE.
//dzzcc

class UserDefault {
    static let shared = UserDefault()

    // MARK: - Variables & Constants
    var continueAsAGuest: Bool = false
    // User Data
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var picture: String = ""
    var phone: String = ""
    var lastLogin: String = ""
    var gender: String = ""
    var birthDate: String = ""
    var device: String = ""
    var verifiedWith: String = ""
    var language: String = ""
    var token: String = ""
    var isLogin: Bool = false


    init() { getStoredData() }

    func storeData() {
        SharedPref.shared.setSharedValue("continueAsAGuest", value: self.continueAsAGuest)
        // User Data
        SharedPref.shared.setSharedValue("id", value: self.id)
        SharedPref.shared.setSharedValue("name", value: self.name)
        SharedPref.shared.setSharedValue("email", value: self.email)
        SharedPref.shared.setSharedValue("picture", value: self.picture)
        SharedPref.shared.setSharedValue("phone", value: self.phone)
        SharedPref.shared.setSharedValue("lastLogin", value: self.lastLogin)
        SharedPref.shared.setSharedValue("gender", value: self.gender)
        SharedPref.shared.setSharedValue("birthDate", value: self.birthDate)
        SharedPref.shared.setSharedValue("device", value: self.device)
        SharedPref.shared.setSharedValue("verifiedWith", value: self.verifiedWith)
        SharedPref.shared.setSharedValue("language", value: self.language)
        SharedPref.shared.setSharedValue("token", value: self.token)
        SharedPref.shared.setSharedValue("isLogin", value: self.isLogin)
    }

    func getStoredData() {
        self.continueAsAGuest = SharedPref.shared.getSharedValue(forKey: "continueAsAGuest") as? Bool ?? false
        // User Data
        self.id = SharedPref.shared.getSharedValue(forKey: "id") as? Int ?? 0
        self.name = SharedPref.shared.getSharedValue(forKey: "name") as? String ?? ""
        self.email = SharedPref.shared.getSharedValue(forKey: "email") as? String ?? ""
        self.picture = SharedPref.shared.getSharedValue(forKey: "picture") as? String ?? ""
        self.phone = SharedPref.shared.getSharedValue(forKey: "phone") as? String ?? ""
        self.lastLogin = SharedPref.shared.getSharedValue(forKey: "lastLogin") as? String ?? ""
        self.gender = SharedPref.shared.getSharedValue(forKey: "gender") as? String ?? ""
        self.birthDate = SharedPref.shared.getSharedValue(forKey: "birthDate") as? String ?? ""
        self.device = SharedPref.shared.getSharedValue(forKey: "device") as? String ?? ""
        self.verifiedWith = SharedPref.shared.getSharedValue(forKey: "verifiedWith") as? String ?? ""
        self.language = SharedPref.shared.getSharedValue(forKey: "language") as? String ?? ""
        self.token = SharedPref.shared.getSharedValue(forKey: "token") as? String ?? ""
        self.isLogin = SharedPref.shared.getSharedValue(forKey: "isLogin") as? Bool ?? false

    }

    func logout() {
        SharedPref.shared.removeValue(forKey: "continueAsAGuest")
        // User Data
        SharedPref.shared.removeValue(forKey: "id")
        SharedPref.shared.removeValue(forKey: "name")
        SharedPref.shared.removeValue(forKey: "email")
        SharedPref.shared.removeValue(forKey: "picture")
        SharedPref.shared.removeValue(forKey: "phone")
        SharedPref.shared.removeValue(forKey: "lastLogin")
        SharedPref.shared.removeValue(forKey: "gender")
        SharedPref.shared.removeValue(forKey: "birthDate")
        SharedPref.shared.removeValue(forKey: "device")
        SharedPref.shared.removeValue(forKey: "verifiedWith")
        SharedPref.shared.removeValue(forKey: "language")
        SharedPref.shared.removeValue(forKey: "token")
        SharedPref.shared.removeValue(forKey: "isLogin")

        getStoredData()
    }

}
