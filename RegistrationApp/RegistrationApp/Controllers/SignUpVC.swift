//
//  SignUpVC.swift
//  RegistrationApp
//
//  Created by Владислав on 31.07.22.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignIn.frame.size.width = 125
        btnSignIn.frame.size.height = 125
        btnSignIn.layer.cornerRadius = btnSignIn.frame.width / 2
        btnSignIn.layer.masksToBounds = true
    }

}
