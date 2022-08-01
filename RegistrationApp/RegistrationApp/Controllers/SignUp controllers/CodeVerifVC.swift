//
//  CodeVerifVC.swift
//  RegistrationApp
//
//  Created by Владислав on 2.08.22.
//

import UIKit

class CodeVerifVC: UIViewController {
    
    var code = Int.random(in: 20000...100000)
    
    @IBOutlet weak var labelCode: UILabel!
    @IBOutlet weak var codeTF: UITextField!
    override func viewDidLoad() {
        labelCode.text = (" Secret key is  \(code)")
            super.viewDidLoad()
    }
    @IBAction func codeTFAction() {
        if codeTF.text == String(code) {
            performSegue(withIdentifier: "goToLastPage", sender: nil)
        }
    }
}
