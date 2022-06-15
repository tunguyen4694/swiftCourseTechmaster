//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var datas: [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "To Do List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.separatorInset = .zero
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TodoListCell", bundle: nil), forCellReuseIdentifier: "TodoList")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToCreateTodo))
        
        navigationItem.rightBarButtonItem = addButton
        
    }
    
    @objc func goToCreateTodo() {
        let createTodoVC = CreateTodoViewController()
        
        createTodoVC.passData = { [weak self] todo in
            guard let strongSelf = self, let todo = todo else { return }
            strongSelf.datas.insert(todo, at: 0)
            strongSelf.tableView.reloadData()
        }
        
        navigationController?.pushViewController(createTodoVC, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoList", for: indexPath) as! TodoListCell
        cell.titleLabel.text = datas[indexPath.row].title
        cell.todo = datas[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editVC = CreateTodoViewController()
        editVC.todo = datas[indexPath.row]
        editVC.passData = { [weak self] todo in
            guard let strongSelf = self, let todo = todo else { return }
            
            strongSelf.datas[indexPath.row] = todo
            strongSelf.tableView.reloadData()
        }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.datas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            let editVC = CreateTodoViewController()
            editVC.todo = self.datas[indexPath.row]
            editVC.passData = { [weak self] todo in
                guard let strongSelf = self, let todo = todo else { return }
                strongSelf.datas[indexPath.row] = todo
                strongSelf.tableView.reloadData()
            }
            self.navigationController?.pushViewController(editVC, animated: true)
        }
        
        let configure = UISwipeActionsConfiguration(actions: [delete, edit])
        return configure
    }
    
}

