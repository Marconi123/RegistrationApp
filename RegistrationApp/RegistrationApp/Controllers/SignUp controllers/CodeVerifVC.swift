//
//  CodeVerifVC.swift
//  RegistrationApp
//
//  Created by Владислав on 2.08.22.
//

import UIKit

final class CodeVerifVC: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet private var instructionTF: UILabel!
    @IBOutlet private var labelCode: UILabel!
    @IBOutlet private var codeTF: UITextField!
    
    // MARK: - Properties
    
    private var secretCode = Int.random(in: 20000 ... 100000)
    var userModelRec: UserModel?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions
    
    @IBAction func codeTFAction(_ sender: UITextField) {
        guard let code = sender.text,
              let codeInt = Int(code),
              codeInt == secretCode
        else {
            let countOfChras = sender.text!.count >= 5
            if countOfChras {
                alert(title: "Code verification", message: "Key is mismatched", style: .alert)
            }
            return
        }
        performSegue(withIdentifier: "goToLastPage", sender: userModelRec)
    }
    
    // MARK: - Functiions
    
    private func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setupUI() {
        instructionTF.text = "Please, enter secret key from \(userModelRec?.email ?? "specified") email"
        labelCode.text = " Secret key is  \(secretCode)"
    }

    private func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText)
        else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 6
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let WelcomeVC = segue.destination as? WelcomeVC,
        let userModel = sender as? UserModel {
            WelcomeVC.UserModel = userModel
        }
    }
}
