//
//  ToDo.swift
//  b21ToDoList
//
//  Created by Nguyễn Anh Tú on 22/05/2022.
//

import Foundation
import UIKit

struct Todo {
    var id: String
    var title: String
    var content: String
    var image: UIImage?
    var isCompleted: Bool = false
    var isSelected: Bool = false
    var createdAt: Date?
    
    init(title: String, content: String, image: UIImage?) {
        self.id = UUID().uuidString
        self.title = title
        self.content = content
        self.image = image
        self.createdAt = Date()
    }
    
}

// MARK: - Fake Todos
func fakeTodos() -> [Todo] {
    var todos: [Todo] = []
    let todo1 = Todo(title: "Hoc iOs", content: "Hoc iOS ngay chu nhat", image: .init(named: "1"))
    let todo2 = Todo(title: "Lam bai tap iOs", content: "Can lam nhieu bai tap iOS", image: nil)
    let todo3 = Todo(title: "Rome - Barcelona", content: "Trang mai choi bi muon gio", image: .init(named: "mia1"))
    let todo4 = Todo(title: "Dat chuyen moi", content: "Ngu tai san bay", image: .init(named: "mia2"))
    let todo5 = Todo(title: "Lam bai tap iOs", content: "Can lam nhieu bai tap iOS", image: nil)
    
    todos = [todo1, todo2]  // gán lại mảng todos
    todos.append(todo3)     // thêm một phần tử vào mảng
    todos.append(contentsOf: [todo4, todo5])    // thêm nhiều phẩn tử vào mảng
    
    return todos
}
