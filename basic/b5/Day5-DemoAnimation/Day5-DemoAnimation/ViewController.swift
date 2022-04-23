//
//  ViewController.swift
//  Day5-DemoAnimation
//
//  Created by Nguyễn Anh Tú on 31/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    // Khởi tạo 1 containerView chứa các view con
    let containerView: UIView = UIView()
    
    let titleLabel: UILabel = UILabel()
    
    let nameTextField: UITextField = UITextField()
    
    let nextButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // view: là superView
        // Thêm các components vào superView
        view.backgroundColor = .lightGray
        view.addSubview(containerView)
        containerView.backgroundColor = .brown
        // Set frame cho containerView
        containerView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: view.frame.width, height: view.frame.height))
        
//        containerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        // Lấy ra kích thớc của 1 view
//        view.bounds.width
//        view.bounds.height
        
        // Add Label, textField vào containerView
        containerView.addSubview(titleLabel)
        titleLabel.text = "Đăng nhập"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .cyan
        titleLabel.font = UIFont(name: "Arial", size: 32)
        
        titleLabel.frame = CGRect(x: 0, y: 50, width: containerView.bounds.width/2, height: 50)
        titleLabel.center.x = containerView.center.x
        
        containerView.addSubview(nameTextField)
        nameTextField.frame = CGRect(x: 0, y: titleLabel.frame.maxY+32, width: 250, height: 50)
        nameTextField.center.x = titleLabel.center.x
        nameTextField.backgroundColor = . white
        nameTextField.placeholder = "Nhập tên của bạn"
        
        // Add button
        containerView.addSubview(nextButton)
        nextButton.frame = CGRect(x: 0, y: nameTextField.frame.maxY+32, width: 150, height: 50)
        nextButton.backgroundColor = .black
        nextButton.center.x = nameTextField.center.x
        // Set text cho Button
        nextButton.setTitle("Next", for: .normal)
        // Set màu title cho Button
        nextButton.setTitleColor(.white, for: .normal)
        // Tương tự cũng có các thuộc tính alpha, clipToBounds,...
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 16
        
        // Add action cho Button
        nextButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        // Set image
        nextButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        
        // Đưa 1 subview lên bề mặt view chứa nó
        view.bringSubviewToFront(continueButton)
        
        // Kiểm tra button có đang trạng thái nào đó không
        print(nextButton.isSelected)
        nextButton.isSelected = true
        nextButton.alpha = 0
        titleLabel.center.y = -50
        // MARK: Animation khối lệnh được thực hiện xong trong thời gian duration
        UIView.animate(withDuration: 5) {
            self.nextButton.alpha = 1
            self.titleLabel.center.y = 60
        }
    }

    @objc func tappedButton() {
        print(nameTextField.text ?? "")
        
        // Có nhận tương tác người dùng hay không
        nextButton.isUserInteractionEnabled = true // flase: không nhận
    }

    @IBAction func actionContinue(_ sender: UIButton) {
        print("Action continue")
    }
}

