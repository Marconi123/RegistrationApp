//
//  SecondPageVC.swift
//  RegistrationApp
//
//  Created by Владислав on 8.08.22.
//

import UIKit

final class SecondPageVC: BasicVC {
    private var isSameName = false { didSet { updateSaveBtnState() } }
    private var isSamePassword = false { didSet { updateSaveBtnState() } }
    private var isSameEmail = false { didSet { updateSaveBtnState() } }
    private var passwordStrength: passwordStrength = .veryWeak { didSet { updateSaveBtnState() } }
    private var isCofnPass = false { didSet { updateSaveBtnState() } }
    private var isValidEmail = false { didSet { updateSaveBtnState() } }
    
    var userModel = UserDefautltsService.getUserModel()

    // MARK: - IBOutlets
    
    // Name label
    @IBOutlet private var nameLabel: UILabel!
    // Name TextField
    @IBOutlet private var nameTF: UITextField!
    // Email label
    @IBOutlet private var emailLabel: UILabel!
    // Email TextField
    @IBOutlet private var emailTF: UITextField!
    // Password label
    @IBOutlet private var passwordLabel: UILabel!
    // Password TextField
    @IBOutlet private var passwordTF: UITextField!
    // ConfirmPassword TextField
    @IBOutlet private var confirmPasswordLbl: UITextField!
    // Save button
    @IBOutlet private var saveBtnOut: UIButton!
    // Views indicate password strength
    @IBOutlet private var viewsIndicatorPassword: [UIView]!
    // Error label for email
    @IBOutlet private var emailErrorLbl: UILabel!
    // Error label for password
    @IBOutlet private var passwordError: UILabel!
    // Error label for password confirmation
    @IBOutlet private var passwordConfError: UILabel!
    
    // MARK: - Lify Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions

    // New name field
    
    @IBAction private func nameTFAction(_ sender: UITextField) {
        let currentValue = sender.text
        if currentValue == userModel?.name {
            isSameName = false
        }
        else if currentValue != userModel?.name {
            isSameName = true
        }
    }

    // New email field
    
    @IBAction private func emailTFAction(_ sender: UITextField) {
        guard let email = sender.text else { return }
//        guard VerificationService.isValidEmail(email: email!) else { return emailErrorLbl.isHidden = false }
        if !VerificationService.isValidEmail(email: email) { emailErrorLbl.isHidden = false } else { emailErrorLbl.isHidden = true }
        if email.isEmpty { emailErrorLbl.isHidden = true }
        if email != userModel?.email
        {
            isSameEmail = true
        }
        else {
            isSameEmail = false
        }
        
}
    
    // New password field
    
    @IBAction private func passwordTFAction(_ sender: UITextField) {
        guard let pass = sender.text, !pass.isEmpty else { return }
        passwordStrength = VerificationService.isValidPassword(pass: pass)
        if pass == userModel?.password {
            isSamePassword = false
        }
        else if pass != userModel?.password {
            isSamePassword = true
        }
    }
    
    // Save button action
    
    @IBAction private func saveBtnAction(_ sender: UIButton) {
        guard let name = nameTF.text, let email = emailTF.text, let password = passwordTF.text, email.isEmpty == false, password.isEmpty == false else {
            return alert(title: "Error", message: "Password and email should be specified", style: .alert)
        }
        let newUserModel = UserModel(name: name, email: email, password: password)
        if newUserModel != userModel {
            UserDefautltsService.saveUserModel(userModel: newUserModel)
            alert(title: "Success", message: "Changes are saved", style: .alert)
        }
        else {
            alert(title: "Failure", message: "Nothing to save", style: .alert)
        }
    }

    // MARK: - Functions
    
    // Setup User Interfeice
    private func setupUI() {
        let userName = userModel?.name ?? "Not specified",
            passwordUser = userModel?.password ?? "Not found",
            emailUser = userModel?.email ?? "Not found"
        nameLabel.text = "Name: \(userName)"
        emailLabel.text = "Email: \(emailUser)"
        passwordLabel.text = "Password: \(passwordUser)"
    }
    
    // Update "Save" button state
    private func updateSaveBtnState() {
        saveBtnOut.isEnabled = isSameName || isSameEmail || isSamePassword
    }

    // MARK: - Navigation
}
