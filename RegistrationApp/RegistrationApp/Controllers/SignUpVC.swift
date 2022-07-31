//
//  SignUpVC.swift
//  RegistrationApp
//
//  Created by Владислав on 31.07.22.
//

import UIKit

class SignUpVC: UIViewController {

    enum stateOfSecury {
        case `false`
        case `true`
    }
    
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordInput.isSecureTextEntry = true
    }
    @IBAction func buttonPressed() {
        if passwordInput.isSecureTextEntry == true {
            passwordInput.isSecureTextEntry = false
        } else {
            passwordInput.isSecureTextEntry = true
        }
    }
}
