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
    @IBOutlet weak var passwordConfirmation: UITextField!
    @IBOutlet weak var buttonNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordInput.isSecureTextEntry = true
        passwordConfirmation.isSecureTextEntry = true
        buttonNext.frame.size.width = 125
        buttonNext.frame.size.height = 125
        buttonNext.layer.cornerRadius = buttonNext.frame.width / 2
        buttonNext.layer.masksToBounds = true
    }
    @IBAction func buttonPressed() {
        showPass(field: passwordInput)
    }
    @IBAction func buttonPressedConfirm() {
        showPass(field: passwordConfirmation)
    }
    @IBAction func buttonNextAct() {
        performSegue(withIdentifier: "goToVerification", sender: nil)
    }
    func showPass (field:UITextField) -> Void {
        if field.isSecureTextEntry == true {
            field.isSecureTextEntry = false
        } else {
            field.isSecureTextEntry = true
        }
    }
}
