//
//  ViewController.swift
//  b11Alert
//
//  Created by Nguyễn Anh Tú on 16/04/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert()
    }

    func showAlert() {
        let alert = UIAlertController(title: "Nhập thông tin", message: "Nhập tên của bạn", preferredStyle: .alert)
        
        let actionDone = UIAlertAction(title: "Done", style: .default) { _ in
            // Lấy ra list textField trong alertController
            if let listTextField = alert.textFields {
                print(listTextField[0].text ?? "")
                print(listTextField[1].text ?? "")
            }
        }
        alert.addAction(actionDone)
        
        // Thêm textField vào alert
        alert.addTextField { nameTextField in
            nameTextField.placeholder = "Tên đăng nhập"
        }
        
        alert.addTextField { passwordTextField in
            passwordTextField.placeholder = "Mật khẩu"
            passwordTextField.isSecureTextEntry = true
        }
        
        // Thêm một số thuộc tính để không crash trên iPad (bắt buộc)
        alert.popoverPresentationController?.sourceView = self.view
        
        // Hiển thị alert giữa màn hình
        alert.popoverPresentationController?.sourceRect = CGRect(origin: CGPoint(x: view.bounds.midX, y: view.bounds.midY), size: .init(width: 0, height: 0))
        
        // Hiển thị hướng mũi tên của alertController trên iPad
        alert.popoverPresentationController?.permittedArrowDirections = []
        
        present(alert, animated: true)
    }

}

