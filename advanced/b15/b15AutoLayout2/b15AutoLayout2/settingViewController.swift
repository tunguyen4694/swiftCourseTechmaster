//
//  settingViewController.swift
//  b15AutoLayout2
//
//  Created by Nguyễn Anh Tú on 28/04/2022.
//

import UIKit

class settingViewController: UIViewController {

//    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
//    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
//    @IBOutlet weak var squareView: UIView!
    
    @IBOutlet weak var smallButton: UIButton!
    
    @IBOutlet weak var largeButton: UIButton!
    
    @IBOutlet weak var headerView: UIView!
    let squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func config() {
        view.addSubview(squareView)
        squareView.backgroundColor = .systemOrange
        squareView.translatesAutoresizingMaskIntoConstraints = false
        
        squareView.superview?.addConstraints([
            NSLayoutConstraint.init(item: squareView, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .bottom, multiplier: 1, constant: 200),
            NSLayoutConstraint.init(item: squareView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
    
        
    }
//    @IBAction func smallButtonAction(_ sender: Any) {
//        widthConstraint.constant = 100
//        heightConstraint.constant = 100
//        squareView.layoutIfNeeded()
//        UIView.animate(withDuration: 5) {
//            self.widthConstraint.constant = 100
//            self.heightConstraint.constant = 100
//            self.view.layoutIfNeeded()
//            self.squareView.superview?.layoutIfNeeded()
//        } completion: { _ in
//            self.squareView.backgroundColor = .systemOrange
//        }

    
//    @IBAction func largeButtonAction(_ sender: Any) {
//        widthConstraint.constant = 200
//        heightConstraint.constant = 200
//        squareView.layoutIfNeeded()
//        UIView.animate(withDuration: 5) {
//            self.widthConstraint.constant = 200
//            self.heightConstraint.constant = 200
//            self.view.layoutIfNeeded()
//            self.squareView.superview?.layoutIfNeeded()
//        } completion: { _ in
//            self.squareView.backgroundColor = .systemYellow
//        }
//
//    }
    


}
