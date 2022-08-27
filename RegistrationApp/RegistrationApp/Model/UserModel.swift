//
//  UserModel.swift
//  RegistrationApp
//
//  Created by Владислав on 4.08.22.
//

import Foundation

// MARK: - User model

struct UserModel:Equatable {
    let name: String?
    let email: String
    let password: String
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        lhs.name  == rhs.name
        && lhs.email == rhs.email
        && lhs.password == rhs.email
    }
    
}
