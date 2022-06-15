//
//  ToDo.swift
//  ToDoListApp
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
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
    var createdAt: Data?

    init(title: String, content: String, image: UIImage?) {
        self.id = UUID().uuidString
        self.title = title
        self.content = content
        self.image = image
        self.createdAt = Data()
    }
}

func fakeTodos() -> [Todo] {
    var todos: [Todo] = []
    return todos
}
