//
//  settingViewController.swift
//  ontapB15
//
//  Created by Nguyễn Anh Tú on 08/05/2022.
//

import UIKit

class settingViewController: UIViewController {

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var squreView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func smallButtonDidTap(_ sender: Any) {
        
        UIView.animate(withDuration: 1) {
            self.widthConstraint.constant = 100
            self.heightConstraint.constant = 100
            self.squreView.backgroundColor = .systemYellow
            self.squreView.superview?.layoutIfNeeded()
        } completion: { _ in
            self.squreView.backgroundColor = .systemBlue
        }
    }
    
    @IBAction func largeButtonDidTap(_ sender: Any) {
        widthConstraint.constant = 200
        heightConstraint.constant = 200
        squreView.backgroundColor = .systemOrange
        UIView.animate(withDuration: 1) {
            self.widthConstraint.constant = 200
            self.heightConstraint.constant = 200
            self.squreView.backgroundColor = .systemOrange
            self.squreView.superview?.layoutIfNeeded()
        } completion: { _ in
            self.squreView.backgroundColor = .systemMint
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
