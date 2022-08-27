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
    @IBOutlet private var emailTF: UITextField!
    @IBOutlet private var errorEmailTF: UILabel!
    /// name
    @IBOutlet private var nameTF: UITextField!
    /// password
    @IBOutlet private var passwordInput: UITextField!
    @IBOutlet private var passwordConfirmation: UITextField!
    /// confirm password
    @IBOutlet private var errorPasswordMessage: UILabel!
    @IBOutlet var errorConfPassMessage: UILabel!
    /// indicators of password strength
    @IBOutlet private var viewsPasswordIndicators: [UIView]!
    /// confirm button
    @IBOutlet private var buttonNext: UIButton!
    /// ScrollView
    @IBOutlet private weak var scrollview: UIScrollView!
    
    // MARK: - Properties

    private var isValidEmail = false { didSet { updateContinueBtnState() } }
    private var isConfPass = false { didSet { updateContinueBtnState() } }
    private var passwordStrength: passwordStrength = .veryWeak { didSet { updateContinueBtnState() } }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
        roundButton(button: buttonNext)
    }
    
    // MARK: - Actions
    
    @IBAction func emailAction(_ sender: UITextField) {
        if let email = sender.text,
           !email.isEmpty,
           VerificationService.isValidEmail(email: email)
        {
            isValidEmail = true
            errorEmailTF.isHidden = true
        } else {
            errorEmailTF.isHidden = false
        }
    }

    @IBAction func passwordTFAction(_ sender: UITextField) {
        secureField(field: sender)
        if let pass = sender.text,
           !pass.isEmpty
        {
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
           let pass = passwordInput.text
        {
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
    
    private func showPass(field: UITextField) {
        if field.isSecureTextEntry == true {
            field.isSecureTextEntry = false
        } else {
            field.isSecureTextEntry = true
        }
    }

    private func secureField(field: UITextField) {
        field.isSecureTextEntry = true
    }
    
    private func roundButton(button: UIButton) {
        button.frame.size.width = 125
        button.frame.size.height = 125
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
        @objc private func keyboardWillShow(notification: Notification) {
            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollview.contentInset = contentInsets
            scrollview.scrollIndicatorInsets = contentInsets
        }
    
    @objc private func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollview.contentInset = contentInsets
        scrollview.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let codeVerifVC = segue.destination as? CodeVerifVC,
           let userModel = sender as? UserModel
        {
            codeVerifVC.userModelRec = userModel
        }
    }
}
