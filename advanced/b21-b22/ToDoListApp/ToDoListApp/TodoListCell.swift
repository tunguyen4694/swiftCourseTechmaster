//
//  TodoListCell.swift
//  ToDoListApp
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//

import UIKit

class TodoListCell: UITableViewCell {
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var isDone: Bool?
    
    var todo: Todo? {
        didSet {
            guard let todo = todo else {
                return
            }
            self.titleLabel.text = todo.title
            self.isDone = todo.isCompleted
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 18)
        checkImage.image = UIImage(systemName: "circle")
    }
    
    @IBAction func checkList(_ sender: Any) {
        if isDone == false {
            checkImage.image = UIImage(systemName: "checkmark.circle.fill")
            isDone = true
        } else {
            checkImage.image = UIImage(systemName: "circle")
            isDone = false
        }
    }
}
