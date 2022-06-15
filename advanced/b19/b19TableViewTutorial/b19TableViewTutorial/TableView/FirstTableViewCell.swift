//
//  FirstTableViewCell.swift
//  b19TableViewTutorial
//
//  Created by Nguyễn Anh Tú on 14/05/2022.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    var thumbImageView = UIImageView()
    
    // Khi k có file xib, thì sử dụng setSelected

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        layoutCell()
    }
    
    func layoutCell() {
        
        // Tạo 1 UiImageView
        // addSubView
        
        thumbImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 64, height: 200))
        thumbImageView.image = UIImage(named: "7")
        thumbImageView.contentMode = .scaleAspectFill
        thumbImageView.clipsToBounds = true
        
        self.addSubview(thumbImageView)
    }

}
