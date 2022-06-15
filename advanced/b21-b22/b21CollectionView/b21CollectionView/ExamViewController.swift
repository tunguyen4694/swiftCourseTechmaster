//
//  ExamViewController.swift
//  b21CollectionView
//
//  Created by Nguyễn Anh Tú on 22/05/2022.
//

import UIKit

class ExamViewController: UIViewController {
    
    var delegate: MyDelagate?    // pas data - Delegate: B2 -> Khai báo biến delegate

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        // Đăng ký nhận thông báo
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NSNotification.Name("ResultDismiss"), object: nil)
    }

    @objc func handleNotification(_ notification: Notification) {
        if let data = notification.object {
            print(data)
        }
//        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onGoResult(_ sender: Any) {
        let resultVC = ResultViewController()
        navigationController?.pushViewController(resultVC, animated: true)
        
        delegate?.passData(data: "Mia")     // pas data - Delegate: B3 -> Khởi tạo và truyền dữ liệu
        navigationController?.popViewController(animated: true)
    }
    
  

}
