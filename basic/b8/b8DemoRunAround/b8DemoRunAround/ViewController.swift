//
//  ViewController.swift
//  b8DemoRunAround
//
//  Created by Nguyễn Anh Tú on 07/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let containerView: UIView = UIView()
    var timer1: Timer!
    var timer2: Timer!
    var timer3: Timer!
    var timer4: Timer!

    let tempView: UIView = UIView()
    var rotate = 0
    var timer5: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        view.addSubview(containerView)
        containerView.frame = CGRect(x: 0, y: 32, width: 100, height: 100)
        containerView.layer.cornerRadius = 50
        containerView.clipsToBounds = true
        containerView.backgroundColor = .red
        
        containerView.addSubview(tempView)
        tempView.frame = .init(x: 10, y: 10, width: 20, height: 20)
        tempView.backgroundColor = .systemYellow
        tempView.clipsToBounds = true
        tempView.layer.cornerRadius = 10
        
//        timer5 = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
//            self.rotate += 1
//            let rads = .pi/180 * CGFloat(self.rotate)
//            self.containerView.transform = CGAffineTransform.init(rotationAngle: rads)
//        })
        
        leftToRight()
//        animate()
    }
    
    // Dùng hàm để lặp lại
    func leftToRight() {
        timer1 = Timer.scheduledTimer(withTimeInterval: 0.0005, repeats: true, block: { _ in
            self.containerView.frame.origin.x += 0.1
            if self.containerView.frame.maxX >= self.view.frame.maxX {
                self.timer1.invalidate()
                self.downBall()
            }
        })
    }
    
    func downBall() {
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.0005, repeats: true, block: { _ in
            self.containerView.frame.origin.y += 0.1
            if self.containerView.frame.maxY >= self.view.frame.maxY {
                self.timer2.invalidate()
                self.rightToLeft()
            }
        })
    }
    
    func rightToLeft() {
        timer3 = Timer.scheduledTimer(withTimeInterval: 0.0005, repeats: true, block: { _ in
            self.containerView.frame.origin.x -= 0.1
            if self.containerView.frame.minX <= self.view.frame.minX {
                self.timer3.invalidate()
                self.upBall()
            }
        })
    }
    
    func upBall() {
        timer4 = Timer.scheduledTimer(withTimeInterval: 0.0005, repeats: true, block: { _ in
            self.containerView.frame.origin.y -= 0.1
            if self.containerView.frame.minY <= self.view.frame.minY+32 {
                self.timer4.invalidate()
                self.leftToRight()
            }
        })
    }
    
    func animate(){
            UIView.animate(withDuration: 1, animations: {
                self.containerView.frame.origin.x = self.view.frame.maxX - 100
            }) { (true) in
                UIView.animate(withDuration: 2, animations: {
                    self.containerView.frame.origin.y = self.view.frame.maxY - 100
                }) { (true) in
                    UIView.animate(withDuration: 1, animations: {
                        self.containerView.frame.origin.x = 0
                    }) { (true) in
                        UIView.animate(withDuration: 2, animations: {
                            self.containerView.frame.origin.y = 32
                        }) { (true) in
                            self.animate()
                        }
                    }
                }
            }
        }
                                      

}

