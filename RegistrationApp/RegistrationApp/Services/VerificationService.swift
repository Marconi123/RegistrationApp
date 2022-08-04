//
//  VerificationService.swift
//  RegistrationApp
//
//  Created by Владислав on 3.08.22.
//

import Foundation

enum passwordStrength: Int {
    case veryWeak
    case weak
    case average
    case notStrong
    case Strong
}

enum VerificationService {
    
    // MARK: - specifying content within password fields
    
    static let weakRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    static let averageRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    static let notStrongRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    static let strongRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"

    static func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: email)
    }
    
    // MARK: - Password validation

    static func isValidPassword(pass: String) -> passwordStrength {
        if NSPredicate(format: "SELF MATCHES %@", strongRegex).evaluate(with: pass) {
            return .Strong
        } else if NSPredicate(format: "SELF MATCHES %@", notStrongRegex).evaluate(with: pass) {
            return .notStrong
        } else if NSPredicate(format: "SELF MATCHES %@", averageRegex).evaluate(with: pass) {
            return .average
        } else if NSPredicate(format: "SELF MATCHES %@", weakRegex).evaluate(with: pass) {
            return .weak
        } else {
            return .veryWeak
        }
    }

    // MARK: - passwords verification
    
    static func isPassConfirm(pass1: String, pass2: String) -> Bool {
        return pass1 == pass2
    }
}
