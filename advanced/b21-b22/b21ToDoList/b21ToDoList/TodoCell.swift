//
//  TodoCell.swift
//  b21ToDoList
//
//  Created by Nguyễn Anh Tú on 22/05/2022.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageConstraint: NSLayoutConstraint!
    
    var todo: Todo? {
        didSet {
            guard let todo = todo else {
                return
            }
            self.titleLabel.text = todo.title
            self.contentLabel.text = todo.content
            
            if let image = todo.image {
                self.photoImageView.image = image
                self.heightImageConstraint.constant = 200
                self.topImageConstraint.constant = 20
            } else {
                self.heightImageConstraint.constant = 0
                self.topImageConstraint.constant = 0
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLabel.numberOfLines = 0
        heightImageConstraint.constant = 0
        topImageConstraint.constant = 0
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        photoImageView.layer.cornerRadius = 4
        photoImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
