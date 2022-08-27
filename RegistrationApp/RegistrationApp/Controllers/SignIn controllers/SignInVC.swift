//
//  SignInVC.swift
//  RegistrationApp
//
//  Created by Владислав on 31.07.22.
//

import UIKit

final class SignInVC:BasicVC {
    // MARK: - IBOutlets

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
    
    @IBAction private func createAnAccountBtn() {
        performSegue(withIdentifier: "goToSignUp", sender: nil)
    }

    @IBAction private func loginBtn() {
        let userModel = UserDefautltsService.getUserModel(),
            email = emailField.text,
            pass = passwordTextField.text
        if email == userModel?.email, pass == userModel?.password {
            performSegue(withIdentifier: "goToMain", sender: userModel)
        } else if email != userModel?.email, pass != userModel?.password {
            alert(title: "Error", message: "Verify entered data", style: .alert)
        } else if email != userModel?.email {
            alert(title: "Error", message: "Invalid email", style: .alert)
        } else if pass != userModel?.password {
            alert(title: "Error", message: "Invalid password", style: .alert)
        }
    }

    // MARK: - Functions
    private func setupUI() {
        emailField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.isSecureTextEntry = true
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let firstPageVC = segue.destination as? FirstPageVC,
           let userModel = sender as? UserModel
        {
            firstPageVC.userModel = userModel
        }
    }
}
