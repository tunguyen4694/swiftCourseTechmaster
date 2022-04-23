//
//  ViewController.swift
//  vdB4
//
//  Created by Nguyễn Anh Tú on 07/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        phoneNumberTextField.placeholder = "Phone number"
        passwordTextField.placeholder = "Password"
        
        phoneNumberView.clipsToBounds = true
        // cornerRadius: Bo cong các góc
        phoneNumberView.layer.cornerRadius = 20
        // maskedCorners
//        phoneNumberView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        passwordView.layer.cornerRadius = 20
    }


}

