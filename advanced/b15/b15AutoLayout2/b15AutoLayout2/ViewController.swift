//
//  ViewController.swift
//  b15AutoLayout2
//
//  Created by Nguyễn Anh Tú on 28/04/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            let vc = settingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }

}

