//
//  ViewController.swift
//  b24FireBase
//
//  Created by Nguyễn Anh Tú on 26/05/2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().createUser(withEmail: "tunguyen4694@gmail.com", password: "123456") {
            result, error in
            if let user = result?.user {
                print("Tạo tài khoản thành công")
                print("Thông tin user là \(user.email) - \(user.uid)")
            } else {
                print("Tạo tài khoản không thành công")
                print("Lỗi \(error?.localizedDescription ?? "")")
            }
        }
    }

    // Đăng nhập: Gọi hàm signIn()
    // Đăng xuất: Gọi hàm signOut()

}

