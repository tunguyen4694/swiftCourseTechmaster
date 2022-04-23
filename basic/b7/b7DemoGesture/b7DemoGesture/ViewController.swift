//
//  ViewController.swift
//  b7DemoGesture
//
//  Created by Nguyễn Anh Tú on 05/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Cho phép tương tác với người dùng
        contentImageView.isUserInteractionEnabled = true
        
        // MARK: UITapGesture: Thao tác chạm
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionTap))
        
        contentImageView.addGestureRecognizer(tapGesture)
        
        // MARK: UIPanGesture: Thao tác kéo
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(actionPan(sender:)))
        
//        contentImageView.addGestureRecognizer(panGesture)
        
        // MARK: UIPinGesture: Thao tác thu phóng bằng 2 ngón
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(actionPin(sender:)))
        
        contentImageView.addGestureRecognizer(pinGesture)
        
        // MARK: UIRotationGesture: Thao tác hai ngón để xoay đối tượng
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(actionRotation(sender:)))
        
        contentImageView.addGestureRecognizer(rotationGesture)
        
        // MARK: UILongPressgesture
        let longPressgesture = UILongPressGestureRecognizer(target: self, action: #selector(actionLongPressgesture))
        
        contentImageView.addGestureRecognizer(longPressgesture)
        
        // MARK: UISwipeGesture: Thao tác vuốt lên đối tượng
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        // Hướng vuốt
        swipeDownGesture.direction = .down
        contentImageView.addGestureRecognizer(swipeDownGesture)
        
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        // Hướng vuốt
        swipeUpGesture.direction = .up
        contentImageView.addGestureRecognizer(swipeUpGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        // Hướng vuốt
        swipeLeftGesture.direction = .left
        contentImageView.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        // Hướng vuốt
        swipeRightGesture.direction = .right
        contentImageView.addGestureRecognizer(swipeRightGesture)
        
    }
    
    @objc func actionTap() {
        print("Tapped Image")
    }

    @objc func actionPan(sender: UIPanGestureRecognizer){
        let point = sender.location(in: view)
        contentImageView.center = point
    }

    @objc func actionPin(sender: UIPinchGestureRecognizer){
        contentImageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        print(sender.scale)
    }
    
    @objc func actionRotation(sender: UIRotationGestureRecognizer){
        contentImageView.transform = contentImageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    @objc func actionLongPressgesture() {
        print("Long Pressed")
    }
    
    @objc func swipeDown() {
        print("Swipe Down")
    }
    
    @objc func swipeUp() {
        print("Swipe Up")
    }
    
    @objc func swipeLeft() {
        print("Swipe Left")
    }
    
    @objc func swipeRight() {
        print("Swipe Right")
    }
    
}

