//
//  FirstPageVC.swift
//  RegistrationApp
//
//  Created by Владислав on 7.08.22.
//

import UIKit

final class FirstPageVC: UIViewController {
    
    // MARK: - Life cycle
    var userModel = UserDefautltsService.getUserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var passwordLabel: UILabel!
    // MARK: - Actions
    
    @IBAction func editBtnAction() {
        performSegue(withIdentifier: "goToEditPage", sender: nil)
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

    // MARK: - Navigation
}
