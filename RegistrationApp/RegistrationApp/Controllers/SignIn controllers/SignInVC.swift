//
//  SignInVC.swift
//  RegistrationApp
//
//  Created by Владислав on 31.07.22.
//

import UIKit

final class SignInVC: UIViewController {
    // MARK: - IBoutlets

    @IBOutlet private var btnSignIn: UIButton!
    @IBOutlet private var emailField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButtonOutl: UIButton!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions
    
    @IBAction func createAnAccountBtn() {
        performSegue(withIdentifier: "goToSignUp", sender: nil)
    }

    @IBAction func loginBtn() {
        if let email = emailField.text,
           let pass = passwordTextField.text,
           let userModel = UserDefautltsService.getUserModel(),
           email == userModel.email, pass == userModel.password {
            performSegue(withIdentifier: "goToMain", sender: nil)
        }
    }

    // MARK: - Functions
    
    private func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
   private func setupUI() {
        emailField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}
