//
//  LoginModel.swift
//  SukkarApp
//
//  Created by amgad on 12/10/2566 BE.
//

import Foundation
struct Login: Codable {
    let customers : [Customers]?
    
}

struct Customers : Codable {
    let reward_points_balance : String?
    let reward_points_amount : String?
    let min_reward_points_balance : String?
    let min_reward_points_amount : String?
    let shopping_cart_items : [String]?
    let billing_address : String?
    let shipping_address : String?
    let addresses : [String]?
    let customer_guid : String?
    let verify_code : String?
    let username : String?
    let email : String?
    let first_name : String?
    let last_name : String?
    let phone : String?
    let language_id : String?
    let date_of_birth : String?
    let gender : String?
    let avatar_url : String?
    let admin_comment : String?
    let is_tax_exempt : Bool?
    let vendor_id : Int?
    let has_shopping_cart_items : Bool?
    let verified : Bool?
    let active : Bool?
    let deleted : Bool?
    let is_system_account : Bool?
    let system_name : String?
    let last_ip_address : String?
    let created_on_utc : String?
    let last_login_date_utc : String?
    let last_activity_date_utc : String?
    let registered_in_store_id : Int?
    let subscribed_to_newsletter : Bool?
    let role_ids : [Int]?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case reward_points_balance = "reward_points_balance"
        case reward_points_amount = "reward_points_amount"
        case min_reward_points_balance = "min_reward_points_balance"
        case min_reward_points_amount = "min_reward_points_amount"
        case shopping_cart_items = "shopping_cart_items"
        case billing_address = "billing_address"
        case shipping_address = "shipping_address"
        case addresses = "addresses"
        case customer_guid = "customer_guid"
        case verify_code = "verify_code"
        case username = "username"
        case email = "email"
        case first_name = "first_name"
        case last_name = "last_name"
        case phone = "phone"
        case language_id = "language_id"
        case date_of_birth = "date_of_birth"
        case gender = "gender"
        case avatar_url = "avatar_url"
        case admin_comment = "admin_comment"
        case is_tax_exempt = "is_tax_exempt"
        case vendor_id = "vendor_id"
        case has_shopping_cart_items = "has_shopping_cart_items"
        case verified = "verified"
        case active = "active"
        case deleted = "deleted"
        case is_system_account = "is_system_account"
        case system_name = "system_name"
        case last_ip_address = "last_ip_address"
        case created_on_utc = "created_on_utc"
        case last_login_date_utc = "last_login_date_utc"
        case last_activity_date_utc = "last_activity_date_utc"
        case registered_in_store_id = "registered_in_store_id"
        case subscribed_to_newsletter = "subscribed_to_newsletter"
        case role_ids = "role_ids"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reward_points_balance = try values.decodeIfPresent(String.self, forKey: .reward_points_balance)
        reward_points_amount = try values.decodeIfPresent(String.self, forKey: .reward_points_amount)
        min_reward_points_balance = try values.decodeIfPresent(String.self, forKey: .min_reward_points_balance)
        min_reward_points_amount = try values.decodeIfPresent(String.self, forKey: .min_reward_points_amount)
        shopping_cart_items = try values.decodeIfPresent([String].self, forKey: .shopping_cart_items)
        billing_address = try values.decodeIfPresent(String.self, forKey: .billing_address)
        shipping_address = try values.decodeIfPresent(String.self, forKey: .shipping_address)
        addresses = try values.decodeIfPresent([String].self, forKey: .addresses)
        customer_guid = try values.decodeIfPresent(String.self, forKey: .customer_guid)
        verify_code = try values.decodeIfPresent(String.self, forKey: .verify_code)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        language_id = try values.decodeIfPresent(String.self, forKey: .language_id)
        date_of_birth = try values.decodeIfPresent(String.self, forKey: .date_of_birth)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        avatar_url = try values.decodeIfPresent(String.self, forKey: .avatar_url)
        admin_comment = try values.decodeIfPresent(String.self, forKey: .admin_comment)
        is_tax_exempt = try values.decodeIfPresent(Bool.self, forKey: .is_tax_exempt)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        has_shopping_cart_items = try values.decodeIfPresent(Bool.self, forKey: .has_shopping_cart_items)
        verified = try values.decodeIfPresent(Bool.self, forKey: .verified)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        deleted = try values.decodeIfPresent(Bool.self, forKey: .deleted)
        is_system_account = try values.decodeIfPresent(Bool.self, forKey: .is_system_account)
        system_name = try values.decodeIfPresent(String.self, forKey: .system_name)
        last_ip_address = try values.decodeIfPresent(String.self, forKey: .last_ip_address)
        created_on_utc = try values.decodeIfPresent(String.self, forKey: .created_on_utc)
        last_login_date_utc = try values.decodeIfPresent(String.self, forKey: .last_login_date_utc)
        last_activity_date_utc = try values.decodeIfPresent(String.self, forKey: .last_activity_date_utc)
        registered_in_store_id = try values.decodeIfPresent(Int.self, forKey: .registered_in_store_id)
        subscribed_to_newsletter = try values.decodeIfPresent(Bool.self, forKey: .subscribed_to_newsletter)
        role_ids = try values.decodeIfPresent([Int].self, forKey: .role_ids)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }

}

