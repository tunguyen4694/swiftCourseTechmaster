//
//  FirstViewController.swift
//  b20NavigationCode
//
//  Created by Nguyễn Anh Tú on 18/05/2022.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "First"
        let secondButton = UIBarButtonItem(title: "Second Go", style: .done, target: self, action: #selector(onGoSecond))

        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(onGoBack))
        
    }

    @objc func onGoSecond() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }

    @objc func onGoBack() {
        navigationController?.popViewController(animated: true)
    }


}
