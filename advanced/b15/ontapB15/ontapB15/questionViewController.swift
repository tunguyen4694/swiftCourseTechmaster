//
//  questionViewController.swift
//  ontapB15
//
//  Created by Nguyễn Anh Tú on 08/05/2022.
//

import UIKit

class questionViewController: UIViewController {

    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionImageViewAspectRatioConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionTextLabel: UILabel!
    
    var questionText: String = ""
    var questionImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
        // Do any additional setup after loading the view.
    }
    
    func config() {
        if let image = questionImage {
            questionImageView.image = image
            questionImageViewAspectRatioConstraint.priority = .defaultHigh
            questionImageViewHeightConstraint.priority = .defaultLow
            questionImageViewTopConstraint.constant = 20
        } else {
            questionImageViewAspectRatioConstraint.priority = .defaultLow
            questionImageViewHeightConstraint.priority = .defaultHigh
            questionImageViewTopConstraint.constant = 0
        }
        questionTextLabel.text = questionText
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
