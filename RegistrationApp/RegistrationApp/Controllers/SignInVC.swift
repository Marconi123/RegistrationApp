//
//  SignInVC.swift
//  RegistrationApp
//
//  Created by Владислав on 31.07.22.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonOutl: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    @IBAction func createAnAccountBtn() {
        performSegue(withIdentifier: "goToSignUp", sender: nil)
    }
    @IBAction func loginBtn() {
        
    }

func alert(title: String, message: String, style: UIAlertController.Style) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
    let action = UIAlertAction(title: "Ok", style: .default) { _ in
    }
    alertController.addAction(action)
    self.present(alertController, animated: true, completion: nil)
}
}
