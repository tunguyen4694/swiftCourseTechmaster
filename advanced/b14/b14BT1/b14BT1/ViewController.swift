//
//  ViewController.swift
//  b14BT1
//
//  Created by Nguyễn Anh Tú on 26/04/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let splashVC = bt1ViewController()
        splashVC.modalPresentationStyle = .fullScreen
        present(splashVC, animated: false, completion: nil)
    }

}

