//
//  InforTableViewCell.swift
//  b19PracticeTableView
//
//  Created by Nguyễn Anh Tú on 14/05/2022.
//

import UIKit

class InforTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(user: User) {
        nameLabel.text = user.name
        phoneLabel.text = user.phone
    }
    
}
