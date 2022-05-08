//
//  ViewController.swift
//  b16Controllers
//
//  Created by Nguyễn Anh Tú on 05/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = imagePickerViewController.init()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }

}

