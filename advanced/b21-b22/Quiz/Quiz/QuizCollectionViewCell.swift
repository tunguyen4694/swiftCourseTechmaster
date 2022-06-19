//
//  QuizCollectionViewCell.swift
//  Quiz
//
//  Created by Nguyễn Anh Tú on 19/06/2022.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bView: UIView!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cView: UIView!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var dView: UIView!
    @IBOutlet weak var dLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        aView.layer.cornerRadius = 10
        bView.layer.cornerRadius = 10
        cView.layer.cornerRadius = 10
        dView.layer.cornerRadius = 10
    }

}
