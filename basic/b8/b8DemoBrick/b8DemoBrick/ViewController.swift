//
//  ViewController.swift
//  b8DemoBrick
//
//  Created by Nguyễn Anh Tú on 07/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let containerView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(containerView)
        containerView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        containerView.center = view.center
        containerView.backgroundColor = .red
        
        let L = 200
        let r = 30
        
        // CAShapeLayer
        let topLayer = CAShapeLayer()
        let leftLayer = CAShapeLayer()
        let rightLayer = CAShapeLayer()
        let botLayer = CAShapeLayer()
        
        // UIBezierPath
        let topPath = UIBezierPath()
        // Toạ độ điểm đầu tiên
        topPath.move(to: CGPoint(x: 0, y: 0))
        // Vẽ các điểm tiếp theo
        topPath.addLine(to: CGPoint(x: L, y: 0))
        topPath.addLine(to: .init(x: L-r, y: r))
        topPath.addLine(to: .init(x: r, y: r))
        
        topLayer.path = topPath.cgPath
        topLayer.fillColor = UIColor.white.cgColor
        topLayer.opacity = 0.6
        // Add layer vừa vẽ vào containerView
        containerView.layer.addSublayer(topLayer)
        
        let leftPath = UIBezierPath()
        
        leftPath.move(to: .init(x: 0, y: 0))
        
        leftPath.addLine(to: .init(x: r, y: r))
        leftPath.addLine(to: .init(x: r, y: L-r))
        leftPath.addLine(to: .init(x: 0, y: L))
        
        leftLayer.path = leftPath.cgPath
        leftLayer.fillColor = UIColor.black.cgColor
        leftLayer.opacity = 0.6
        
        containerView.layer.addSublayer(leftLayer)
        
        let rightPath = UIBezierPath()
        
        rightPath.move(to: .init(x: L, y: 0))
        
        rightPath.addLine(to: .init(x: L, y: L))
        rightPath.addLine(to: .init(x: L-r, y: L-r))
        rightPath.addLine(to: .init(x: L-r, y: r))
        
        rightLayer.path = rightPath.cgPath
        rightLayer.fillColor = UIColor.white.cgColor
        rightLayer.opacity = 0.4
        
        containerView.layer.addSublayer(rightLayer)
        
        let botPath = UIBezierPath()
        
        botPath.move(to: .init(x: 0, y: L))
        
        botPath.addLine(to: .init(x: L, y: L))
        botPath.addLine(to: .init(x: L-r, y: L-r))
        botPath.addLine(to: .init(x: r, y: L-r))
        
        botLayer.path = botPath.cgPath
        botLayer.fillColor = UIColor.black.cgColor
        botLayer.opacity = 0.4
        
        containerView.layer.addSublayer(botLayer)
    }


}

