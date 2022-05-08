//
//  codeLayoutViewController.swift
//  ontapB15
//
//  Created by Nguyễn Anh Tú on 08/05/2022.
//

import UIKit

class codeLayoutViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    var squareView = UIView()
    var squareViewWidthConstraint: NSLayoutConstraint!
    var squareViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(squareView)
        
        config()
        
    }

    func config() {
        squareView.backgroundColor = .systemOrange
        squareView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // C1
//        squareView.superview?.addConstraints([
//            NSLayoutConstraint.init(item: squareView, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .bottom, multiplier: 1, constant: 200),
//            NSLayoutConstraint.init(item: squareView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
//                            ])
//        
//        squareViewWidthConstraint = NSLayoutConstraint.init(item: squareView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
//        
//        squareViewHeightConstraint = NSLayoutConstraint.init(item: squareView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
//        
//        squareView.addConstraints([
////            NSLayoutConstraint.init(item: squareView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100),
////            NSLayoutConstraint.init(item: squareView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
//            squareViewWidthConstraint,
//            squareViewHeightConstraint
//        ])
        
        
        // C2
        squareViewWidthConstraint = squareView.widthAnchor.constraint(equalToConstant: 100)
        squareViewHeightConstraint = squareView.heightAnchor.constraint(equalToConstant: 100)
        
        squareView.superview?.addConstraints([
            squareView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 200),
            squareView.centerXAnchor.constraint(equalTo: squareView.superview!.centerXAnchor, constant: 0)
        ])
        
        squareView.addConstraints([
            squareViewWidthConstraint,
            squareViewHeightConstraint
        ])
    }

    @IBAction func smallButtonDidTap(_ sender: Any) {
        UIView.animate(withDuration: 2) {
            self.squareViewWidthConstraint.constant = 100
            self.squareViewHeightConstraint.constant = 100
            self.squareView.backgroundColor = .systemYellow
            self.squareView.superview?.layoutIfNeeded()
        } completion: { _ in
            self.squareView.backgroundColor = .systemOrange
        }
    }
    
    @IBAction func largeButtonDidTap(_ sender: Any) {
        UIView.animate(withDuration: 2) {
            self.squareViewWidthConstraint.constant = 200
            self.squareViewHeightConstraint.constant = 200
            self.squareView.backgroundColor = .systemCyan
            self.squareView.superview?.layoutIfNeeded()
        } completion: { _ in
            self.squareView.backgroundColor = .systemMint
        }
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
