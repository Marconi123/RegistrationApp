//
//  CodeVerifVC.swift
//  RegistrationApp
//
//  Created by Владислав on 2.08.22.
//

import UIKit

class CodeVerifVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var instructionTF: UILabel!
    @IBOutlet weak var labelCode: UILabel!
    @IBOutlet weak var codeTF: UITextField!
    
    // MARK: - Properties
    
    var code = Int.random(in: 20000...100000)
    var userModelRec: UserModel?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        instructionTF.text = ("Please, enter secret key from \(userModelRec?.email ?? "specified") email")
        labelCode.text = (" Secret key is  \(code)")
            super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func codeTFAction() {
        if codeTF.text == String(code) {
            performSegue(withIdentifier: "goToLastPage", sender: nil)
        } else {
            alert(title: "Mismatch", message: "Code is wrong", style: .alert)
        }
    }
    
    // MARK: - Functiions
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
