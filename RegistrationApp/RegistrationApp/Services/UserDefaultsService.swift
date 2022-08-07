//
//  UserDefaultsService.swift
//  RegistrationApp
//
//  Created by Владислав on 7.08.22.
//

import Foundation

final class UserDefautltsService {
    static func saveUserModel(userModel:UserModel) {
        UserDefaults.standard.set(userModel.name,
                                  forKey: UserDefaults.Keys.name.rawValue)
        UserDefaults.standard.set(userModel.email,
                                  forKey: UserDefaults.Keys.email.rawValue)
        UserDefaults.standard.set(userModel.name,
                                  forKey: UserDefaults.Keys.password.rawValue)
    }
    static func getUserModel() -> UserModel? {
        let name = UserDefaults.standard.string(forKey: UserDefaults.Keys.name.rawValue)
        guard let email = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue),
              let password = UserDefaults.standard.string(forKey: UserDefaults.Keys.password.rawValue) else { return nil }
        let userModel = UserModel(name: name, email: email, password: password)
        return userModel
    }
}
