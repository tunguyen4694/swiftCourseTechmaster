//
//  ViewController.swift
//  Quiz
//
//  Created by Nguyễn Anh Tú on 07/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 20
    }

    @IBAction func onStart(_ sender: Any) {
        let vc = QuizViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

