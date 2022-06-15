//
//  ViewController.swift
//  b21ToDoList
//
//  Created by Nguyễn Anh Tú on 22/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    var datas: [Todo] = fakeTodos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "List Todo"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // MARK: Config tableView
        tableVIew.separatorInset = .zero
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(UINib(nibName: "TodoListCell", bundle: nil), forCellReuseIdentifier: "TodoListCell")
        
//        for item in datas {
//            print(item)
//        }
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onGoToCreatTodo))
//        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(onTrashTodo))
        
        navigationItem.rightBarButtonItem = addButton
//        navigationItem.leftBarButtonItem = deleteButton
    }
    
    @objc func onGoToCreatTodo() {
        let createTodoVc = CreateTodoViewControllerViewController()
        
        // B3: Gọi closure
        createTodoVc.passData = { [weak self] todo in   // weak reference in swift, leak memory in swift
            guard let strongSelf = self, let todo = todo else { return }
            
            strongSelf.datas.insert(todo, at: 0)  // self.datas.insert(todo, at: 0)
            strongSelf.tableVIew.reloadData()     // self.tableView.reloadData()
        }
        
        navigationController?.pushViewController(createTodoVc, animated: true)
    }

    @objc func onTrashTodo() {
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath) as! TodoListCell
        cell.titleLabel.text = datas[indexPath.row].title
        cell.todo = datas[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let createVC = CreateTodoViewControllerViewController()
        createVC.todo = datas[indexPath.row]
        createVC.passData = { [weak self] todo in // weark reference in swift, leak memory in swift
            guard let strongSelf = self, let todo = todo else { return }

            strongSelf.datas[indexPath.row] = todo
            strongSelf.tableVIew.reloadData()
        }
        navigationController?.pushViewController(createVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.datas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            let createVC = CreateTodoViewControllerViewController()
            createVC.todo = self.datas[indexPath.row]
            createVC.passData = { [weak self] todo in // weark reference in swift, leak memory in swift
                guard let strongSelf = self, let todo = todo else { return }
                
                strongSelf.datas[indexPath.row] = todo
                strongSelf.tableVIew.reloadData()
            }
            self.navigationController?.pushViewController(createVC, animated: true)
        }
        
        let configure = UISwipeActionsConfiguration(actions: [delete, edit])
        return configure
    }
}
