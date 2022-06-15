//
//  SecondTableViewCell.swift
//  b19TableViewTutorial
//
//  Created by Nguyễn Anh Tú on 14/05/2022.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var threeLabel: UILabel!
    
    // Có file xib thì dùng awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        firstLabel.font = .boldSystemFont(ofSize: 18)
        secondLabel.font = .systemFont(ofSize: 16)
    }
    
    func bindData(text1: String, text2: String, text3: String) {
        firstLabel.text = text1
        secondLabel.text = text2
        threeLabel.text = text3
    }
    
}
