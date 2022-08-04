//
//  SignUpVC.swift
//  RegistrationApp
//
//  Created by Владислав on 31.07.22.
//

import UIKit

final class SignUpVC: UIViewController {
    
    // MARK: - IBOutlet
    
    /// email
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var errorEmailTF: UILabel!
    /// name
    @IBOutlet private weak var nameTF: UITextField!
    /// password
    @IBOutlet private weak var passwordInput: UITextField!
    @IBOutlet private weak var passwordConfirmation: UITextField!
    @IBOutlet private weak var errorPasswordMessage: UILabel!
    @IBOutlet weak var errorConfPassMessage: UILabel!
    /// indicators of password strentgh
    @IBOutlet private var viewsPasswordIndicators: [UIView]!
    // confirm button
    @IBOutlet private weak var buttonNext: UIButton!
    
    // MARK: - Properties

    private var isValidEmail = false {didSet {updateContinueBtnState()} }
    private var isConfPass = false {didSet {updateContinueBtnState()} }
    private var passwordStrength: passwordStrength = .veryWeak {didSet {updateContinueBtnState()} }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        roundButton(button: buttonNext)
    }
    
    // MARK: - Actions
    

    @IBAction func emailTFAction(_ sender: UITextField) {
           if let email = sender.text,
               !email.isEmpty,
               VerificationService.isValidEmail(email: email) {
               isValidEmail = true
           } else {
               errorEmailTF.isHidden = false
           }
           errorEmailTF.isHidden = isValidEmail
       }
    
    @IBAction func passwordTFAction(_ sender: UITextField) {
        secureField(field: sender)
        if let pass = sender.text,
           !pass.isEmpty {
           passwordStrength = VerificationService.isValidPassword(pass: pass)
        }
        errorPasswordMessage.isHidden = passwordStrength != .veryWeak
        setupViews()
    }
    @IBAction func passwordConfirmTFAction(_ sender: UITextField) {
        secureField(field: sender)
        if let confPass = sender.text,
           !confPass.isEmpty,
           let passText = passwordInput.text,
           !passText.isEmpty
        {
           isConfPass = VerificationService.isPassConfirm(pass1: passText,
                                                                pass2: confPass)
        } else {
            isConfPass = false
        }
        errorConfPassMessage.isHidden = isConfPass
        setupViews()
    }
    
    // Secure eye button
    
    @IBAction func buttonPressed() {
        showPass(field: passwordInput)
    }
    
    // Secure eye button
    
    @IBAction func buttonPressedConfirm() {
        showPass(field: passwordConfirmation)
    }
    
    // Confirm button
    
    @IBAction func buttonNextAct() {
        if let email = emailTF.text,
           let pass = passwordInput.text {
           let userModel = UserModel(name: nameTF.text,
                                     email: email,
                                     password: pass)
            performSegue(withIdentifier: "goToVerification", sender: userModel)
        }
    }
    
    // MARK: - Functions
    
    private func setupViews() {
        viewsPasswordIndicators.enumerated().forEach { index, view in
            if index <= (passwordStrength.rawValue - 1) {
                view.alpha = 1
            } else {
            view.alpha = 0.1
        }
    }
}
    
    private func updateContinueBtnState() {
        buttonNext.isEnabled = isValidEmail && isConfPass && passwordStrength != .veryWeak
    }
    
    func showPass (field:UITextField) -> Void {
        if field.isSecureTextEntry == true {
            field.isSecureTextEntry = false
        } else {
            field.isSecureTextEntry = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let codeVerifVC = segue.destination as? CodeVerifVC,
        let userModel = sender as? UserModel {
            codeVerifVC.userModelRec = userModel
        }
    }
    
    private func secureField (field: UITextField) {
        field.isSecureTextEntry = true
    }
    
    private func roundButton(button: UIButton) {
        button.frame.size.width = 125
        button.frame.size.height = 125
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
    }
}
