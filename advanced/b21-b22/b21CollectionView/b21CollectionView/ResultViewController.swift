//
//  ResultViewController.swift
//  b21CollectionView
//
//  Created by Nguyễn Anh Tú on 22/05/2022.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onBackToRoot(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ResultDismiss"), object: "Haha")
//        dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
