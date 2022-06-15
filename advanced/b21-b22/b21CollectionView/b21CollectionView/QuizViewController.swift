//
//  QuizViewController.swift
//  b21CollectionView
//
//  Created by Nguyễn Anh Tú on 22/05/2022.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .darkGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func onStart(_ sender: Any) {
        let examVC = ExamViewController()
        examVC.delegate = self      // pas data - Delegate: B4 -> Gán uỷ quyền cho delegate
        navigationController?.pushViewController(examVC, animated: true)
    }
}


extension QuizViewController: MyDelagate {
    func passData(data: String) {       // pas data - Delegate: B5 -> Thực thi delegate
        print("Data Quiz: ", data)
    }
}
