//
//  ViewController.swift
//  b19PracticeTableView
//
//  Created by Nguyễn Anh Tú on 14/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var arrInfor: [User] = []
    var isEditData = false
    var indexSelected = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configTBV()
    }


    @IBAction func saveAction(_ sender: Any) {
        
        if isEditData {
            let user = User(name: nameTextField.text ?? "No Name", phone: phoneTextField.text ?? "No Phone")
            arrInfor[indexSelected] = user
        } else {
            let user = User(name: nameTextField.text ?? "No Name", phone: phoneTextField.text ?? "No Phone")
            arrInfor.append(user)
        }
        // Đổ dữ liệu cho tableView (bất cứ khi nào data có sự thay đổi)
        tableView.reloadData()
        isEditData = false
        indexSelected = -1
    }
    
    func configTBV() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "InforTableViewCell", bundle: nil), forCellReuseIdentifier: "inforCell")
        // Set hiệu ứng khi cuộn
        tableView.bounces = true
        // Ẩn hiện thanh cuộn
        tableView.showsHorizontalScrollIndicator = false
        // Không cho phép cuộn
        tableView.isScrollEnabled = true  // false: Không cho cuộn
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isEditData = true
        indexSelected = indexPath.row
        nameTextField.text = arrInfor[indexPath.row].name
        phoneTextField.text = arrInfor[indexPath.row].phone
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                arrInfor.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrInfor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inforCell", for: indexPath) as! InforTableViewCell
        cell.bindData(user: arrInfor[indexPath.row])
        return cell
    }
    
}
