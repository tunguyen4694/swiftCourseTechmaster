//
//  ViewController.swift
//  ontapB15
//
//  Created by Nguyễn Anh Tú on 08/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = codeLayoutViewController()
//        vc.questionText = "Answer Question: "
//        vc.questionImage = UIImage.init(named: "sign")
//        vc.questionImage = nil
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }

}

