//
//  WelcomeVC.swift
//  RegistrationApp
//
//  Created by Владислав on 6.08.22.
//

import UIKit

final class WelcomeVC: UIViewController {
    
    var UserModel: UserModel?
    
    // MARK: - IBOutlets

    @IBOutlet private weak var accountCreatedLbl: UILabel!
    @IBOutlet private weak var welcomeLbl: UILabel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Action
    @IBAction func continueBtnAction() {
        guard let UserModel = UserModel else { return }
        UserDefautltsService.saveUserModel(userModel: UserModel)
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Functions
    private func setupUI() {
        let name = UserModel?.name ?? "User,"
        accountCreatedLbl.text = "\(name) your account is created"
    }
}
