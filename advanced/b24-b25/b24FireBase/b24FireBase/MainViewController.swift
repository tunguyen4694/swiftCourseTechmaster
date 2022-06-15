//
//  MainViewController.swift
//  b24FireBase
//
//  Created by Nguyễn Anh Tú on 30/05/2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onPressCreate(_ sender: Any) {
        let createVC = CreateQuizViewController()
        navigationController?.pushViewController(createVC, animated: true)
    }
    

    @IBAction func onPressQuiz(_ sender: Any) {
    }
    
}
