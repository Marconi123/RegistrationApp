//
//  SecondPageVC.swift
//  RegistrationApp
//
//  Created by Владислав on 8.08.22.
//

import UIKit

final class SecondPageVC: UIViewController {
    
    private var isSameName  = false  {didSet { updateContinueBtnState() }}
    private var isSamePassword = false {didSet { updateContinueBtnState() }}
    private var isSameEmail = false {didSet { updateContinueBtnState() }}
    
    var userModel = UserDefautltsService.getUserModel()
    // MARK: - IBOutlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTF: UITextField!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var saveBtnOut: UIButton!
    @IBOutlet private var viewsIndicatorPassword: [UIView]!
    
    // MARK: - Lify Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions

    @IBAction func nameTFAction(_ sender: UITextField) {
        let currentValue = sender.text
        if currentValue == userModel?.name {
            isSameName = false
        }
        else if currentValue != userModel?.name {
            isSameName = true
        }
    }

    @IBAction func emailTFAction(_ sender: UITextField) {
        let currentValue = sender.text
        if currentValue == userModel?.email {
            isSameEmail = false
        }
        else if currentValue != userModel?.email {
            isSameEmail = true
        }
    }
    
    @IBAction func passwordTFAction(_ sender: UITextField) {
        let currentValue = sender.text
        if currentValue == userModel?.password {
            isSamePassword = false
        }
        else if currentValue != userModel?.password {
            isSamePassword = true
        }
    }
    @IBAction func saveBtnAction(_ sender: UIButton) {
        guard let name = nameTF.text, let email = emailTF.text, let password = passwordTF.text else { return }
        let newUserModel = UserModel(name: name, email: email, password: password)
        if newUserModel.name != userModel?.name {
            UserDefaults.standard.set(name, forKey: UserDefaults.Keys.name.rawValue)
            nameTF.text = ""
        }
        if newUserModel.email != userModel?.email {
            UserDefaults.standard.set(email, forKey: UserDefaults.Keys.email.rawValue)
            emailTF.text = ""
        }
        if newUserModel.password != userModel?.password {
            UserDefaults.standard.set(password, forKey: UserDefaults.Keys.password.rawValue)
            passwordTF.text = "
        }
        alert(title: "Success", message: "Changes are saved", style: .alert)
    }
    // MARK: - Functions
    
    private func setupUI() {
        let userName = userModel?.name ?? "Not specified",
            passwordUser = userModel?.password ?? "Not found",
            emailUser = userModel?.email ?? "Not found"
        nameLabel.text = "Name: \(userName)"
        emailLabel.text = "Email: \(emailUser)"
        passwordLabel.text = "Password: \(passwordUser)"
    }
    
    private func updateContinueBtnState() {
        saveBtnOut.isEnabled = isSameName || isSameEmail || isSamePassword
    }
    private func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

}
