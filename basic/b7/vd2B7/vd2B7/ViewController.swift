//
//  ViewController.swift
//  vd2B7
//
//  Created by Nguyễn Anh Tú on 05/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var onImage: UIImageView!
    @IBOutlet weak var onButton: UIButton!
    
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        onButton.setTitle("Off", for: .normal)
        
        onButton.addTarget(self, action: #selector(actionButton(_:)), for: .touchUpInside)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(offTap))
//        onButton.addGestureRecognizer(tapGesture)
    }

    @IBAction func actionButton(_ sender: UIButton) {
//        if sender.isSelected {
//            onImage.image = UIImage(named: "off")
//            onButton.setTitle("On", for: .normal)
//            sender.isSelected = false
//        } else {
//            onImage.image = UIImage(named: "on")
//            onButton.setTitle("Off", for: .normal)
//            sender.isSelected = true
//        }
        
        if isOn { // if isOn == true
            onImage.image = UIImage(named: "off")
            onButton.setTitle("On", for: .normal)
            isOn = false
        } else {
            onImage.image = UIImage(named: "on")
            onButton.setTitle("Off", for: .normal)
            isOn = true
        }
        
    }
    
//    @objc func offTap() {
//        onButton.setTitle("Off", for: .normal)
//        onImage.image = UIImage(named: "off")
//    }

}

