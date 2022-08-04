//
//  SignInVC.swift
//  RegistrationApp
//
//  Created by Владислав on 31.07.22.
//

import UIKit

class SignInVC: UIViewController {
    // MARK: - IBoutlets

    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButtonOutl: UIButton!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    // MARK: - Actions
    
    @IBAction func createAnAccountBtn() {
        performSegue(withIdentifier: "goToSignUp", sender: nil)
    }

    @IBAction func loginBtn() {
    }

    // MARK: - Functions
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
