//
//  RegisterError.swift
//  SukkarApp
//
//  Created by amgad on 12/10/2566 BE.
//


import Foundation
import Alamofire
struct RegisterError : Codable {
    let errors : RErrors?
    
}
struct RErrors : Codable {
    let email : [String]?

}


