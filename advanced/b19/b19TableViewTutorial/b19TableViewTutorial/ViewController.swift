//
//  ViewController.swift
//  b19TableViewTutorial
//
//  Created by Nguyễn Anh Tú on 14/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTBV()

    }

    func configTBV() {
        
        // Kế thừa delegate và dataSource
        tableView.delegate = self
        tableView.dataSource = self
        // Ẩn các row thừa
        tableView.tableFooterView = UIView()
        // Đổi màu thành separator
        tableView.separatorColor = .systemCyan
        
        // Đk cell sử dụng
        // Cell không tạo file xib
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "firstCell")
        
        // Cell tạo file xib
        tableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "secondCell")
    }
}

extension ViewController: UITableViewDelegate {
    // Khi chọn cell ở index
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Vị trí: \(indexPath.row), \(indexPath.section)")
    }
    
    // Hàm gọi khi không chọn row nữa
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Deselect \(indexPath.row)")
    }
    
    // Tương tác Edit data
    
    // C1
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            print("Deleted index: \(indexPath.row)")
        }

        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            print("Edit row at \(indexPath.row)")
        }

        delete.backgroundColor = .red
        edit.backgroundColor = .green

        let configure = UISwipeActionsConfiguration(actions: [delete,edit])
        return configure
    }
    
    // C2
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Delete Commit")
        } else if editingStyle == .insert {

        } else if editingStyle == .none {

        }
    }
    
    // TableView kế thừa từ ScrollView nên có các phương thức của UIScrollViewDelegate
    // Hàm gọi khi chúng ta cuộn
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //
    }
    
}

extension ViewController: UITableViewDataSource {
    
    // Số lượng section trong TBV
    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1  // Section
        return 3
    }
    
    // Số lượng Row trong 1 section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        
        if section == 0 {
            return 2
        } else if section == 1 {
            return 6
        } else {
            return 5
        }
        
    }
    
    // Đặt tiêu đề cho Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "First Section"
        } else if section == 1 {
            return "Second Section"
        } else {
            return "Third Section"
        }
    }
    
    // Hiển thị data trên các Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath.row là vị trí index của cell (row)
        if indexPath.section == 0 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell1")
            cell.imageView?.backgroundColor = .cyan
            cell.textLabel?.text = "Section:\(indexPath.section), row: \(indexPath.row)"
            // Không hiển thị màu xám khi select row
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstTableViewCell
            cell.thumbImageView.backgroundColor = UIColor.brown
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! SecondTableViewCell
            
            cell.bindData(text1: "\(Date())", text2: "\(indexPath.section)", text3: "\(indexPath.row)")
            
            return cell
        }
    }
    // Height của row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
        // Tự tính height cho row phù hợp, với đk là cell đầy đủ layout, ưu tiên bottomAnchor
            return UITableView.automaticDimension
        } else if indexPath.section == 1 {
            return 200
        } else {
            return 100
        }
    }
}
