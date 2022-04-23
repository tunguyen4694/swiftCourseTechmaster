//
//  ViewController.swift
//  b9RunAround
//
//  Created by Nguyễn Anh Tú on 12/04/2022.
//

import UIKit


class ViewController: UIViewController {

    let containerView: UIView = UIView()
    let circleView: UIView = UIView()

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
        containerView.frame = .init(x: 0, y: 0, width: 100, height: 100)
        
        containerView.addSubview(circleView)
        circleView.frame = containerView.bounds
        circleView.layer.cornerRadius = 50
        circleView.clipsToBounds = true
        circleView.backgroundColor = .red
        
        circleView.addSubview(tempView)
        tempView.frame = .init(x: 10, y: 10, width: 20, height: 20)
        tempView.backgroundColor = .systemYellow
        tempView.clipsToBounds = true
        tempView.layer.cornerRadius = 10
        
        leftToRight()
        
        timer5 = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.rotate += 1
            let rads = .pi/180 * CGFloat(self.rotate)
            self.circleView.transform = CGAffineTransform.init(rotationAngle: rads)
        })
        
        
    }

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

}

