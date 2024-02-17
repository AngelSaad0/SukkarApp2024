//
//  String+Extensions.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    public static func localized(_ key: String, language: String? = nil) -> String {
            let language = language ?? Locale.preferredLanguages.first?.components(separatedBy: "-").first ?? "en"
            guard let path = Bundle.main.path(forResource: language, ofType: "lproj"), let bundle = Bundle(path: path) else {
                return Bundle.main.localizedString(forKey: key, value: nil, table: nil)
            }
            return bundle.localizedString(forKey: key, value: nil, table: nil)
        }
}
