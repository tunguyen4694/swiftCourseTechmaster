//
//  TodoListCell.swift
//  b21ToDoList
//
//  Created by Nguyễn Anh Tú on 01/06/2022.
//

import UIKit

class TodoListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    
    var isDone: Bool = false

    var todo: Todo? {
        didSet {
            guard let todo = todo else {
                return
            }
            self.titleLabel.text = todo.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 20)
        checkImage.image = UIImage(systemName: "circle")
    }
    
    @IBAction func checkAction(_ sender: Any) {
        if isDone == false {
            checkImage.image = UIImage(systemName: "checkmark.circle.fill")
            isDone = true
        } else {
            checkImage.image = UIImage(systemName: "circle")
            isDone = false
        }
    }
    
}
