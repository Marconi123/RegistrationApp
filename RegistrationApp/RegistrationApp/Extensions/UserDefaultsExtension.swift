//
//  UserDefaultsExtension.swift
//  RegistrationApp
//
//  Created by Владислав on 7.08.22.
//

import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {

        case email
        case name
        case password

    }

   public func reset() {
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }

}
