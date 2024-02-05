//
//  ErrorModel.swift
//  SukkarApp
//
//  Created by amgad on 12/10/2566 BE.
//

import Foundation
struct LoginError : Codable {
    var errors : LErrors?
}
struct LErrors : Codable {
    var customer : [String]?
}

