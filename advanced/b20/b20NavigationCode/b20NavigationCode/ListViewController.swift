//
//  ListViewController.swift
//  b20NavigationCode
//
//  Created by Nguyễn Anh Tú on 18/05/2022.
//

import UIKit

class ListViewController: UIViewController {

    
    var newBook: Book?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.orange, for: .normal)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        if let newBook = newBook {
            print(newBook)
            AppDelegate.datas.append(newBook)
            tableView.reloadData()
        }
        
    }
    
    
    @IBAction func onDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TableViewCell")
        cell.textLabel?.text = AppDelegate.datas[indexPath.row].name
        cell.detailTextLabel?.text = AppDelegate.datas[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
