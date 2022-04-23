//
//  ViewController.swift
//  Day4View
//
//  Created by Nguyễn Anh Tú on 31/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var contentTextLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var editTextView: UITextView!
    
    /// 1: LoadView: Hàm này sẽ tạo view cho ViewController, được gọi đầu tiên
    override func loadView() {
        super.loadView()
        print("Load View")
    }
    
    /// 2: ViewDidLoad được gọi khi view đã tạo xong
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Did Load")
        // Do any additional setup after loading the view.
        // Trong cả vòng đời của ViewController, viewDidLoad chỉ được gọi 1 lần duy nhất
        // Dùng để gọi dât không có sự thay đổi nhiều
        // Dùng để layout giao diện
        
        // Background: Đổ màu nền view
        // view: là superview mặc định khi tạo ViewController khi kéo outlet, tránh đặt tên trùng với view và contentView
        view.backgroundColor = UIColor.systemGreen
        
        containerView.backgroundColor = UIColor.systemCyan
        
        orangeView.backgroundColor = UIColor.systemOrange
        // center: Lấy toạ độ giữa view
        containerView.center = view.center
        
        // Frame: x, y là toạ độ điểm trên cùng bên trái của view
        // width, height: là kích thước dài rộng view
        containerView.frame = CGRect(x: 10, y: 30, width: 400, height: 830)
        
//        containerView.center = view.center
        
        orangeView.frame = CGRect(x: 10, y: 10, width: 380, height: 300)
        
        // clipToBounds: ẩn phần thừa của view
        containerView.clipsToBounds = true
        
        // alpha: Độ đậm của view
        containerView.alpha = 1
        orangeView.alpha = 1
        
        // set text cho label
        contentTextLabel.text = "Hello 500 anh em"
        contentTextLabel.backgroundColor = UIColor.clear
        contentTextLabel.textAlignment = .center
        
        // Số dòng của label, set = 0 nếu muốn hiển thị nhiều dòng tuỳ vào độ dài text
        contentTextLabel.numberOfLines = 0
        contentTextLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 500)
        contentTextLabel.center = orangeView.center
        
        print(nameTextField.text as Any)
        // set Text:
        nameTextField.text = ""
        // Placeholder: Text mặc định khi người dùng chưa nhập gì
        nameTextField.placeholder = "Nhập tên của bạn"
        
        passwordTextField.placeholder = "Nhập mật khẩu của bạn"
        passwordTextField.isSecureTextEntry = true
        
//        editTextView.isSecureTextEntry = true
        editTextView.textAlignment = .left
        editTextView.backgroundColor = .brown
        
        editTextView.text = "Đây là buổi 4 học UIView - ContenView"
    }
    
    /// 3: Hàm này được gọi mỗi khi ViewController chuẩn bị được hiện lên màn hình
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Will Appear")
    }

    /// 4: Hàm được gọi khi ViewController đã được hiển thị lên màn hình
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Did Appear")
    }
    
    // MARK: Có thể dùng để giải phóng data không dùng đến khi màn hình ẩn đi
    /// 5: Hàm được gọi mỗi khi ViewController chuẩn bị ẩn khỏi màn hình
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Will Disappear")
    }
    
    /// 6: Hàm sẽ được gọi khi ViewController đã ẩn khỏi màn hình
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Did Disappear")
    }
    
    /// 7:  Hàm này được gọi khi ứng dụng sử dụng bộ nhớ tới giới hạn iOS cho phép
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Khi được cảnh báo, chúng ta sẽ phảo giải phóng bớt data không dùng đến, để trả lại bộ nhớ cho hệ thống.
    }

    /// 8: Hàm này được gọi khi ViewController chuẩn bị layout subviews
    /// subViews là những view con nằm trong superView của ViewController
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    /// 9: Hàm gọi khi ViewController đã layout xong
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // Giải phóng bộ nhớ khi ViewController không sử dụng nữa
    deinit {
        
    }
    
}

