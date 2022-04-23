//
//  ViewController.swift
//  b9DemoShadow
//
//  Created by Nguyễn Anh Tú on 12/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let imageView = UIImageView()
    let tempButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        imageView.frame = .init(x: 0, y: 0, width: 100, height: 80)
        imageView.center = view.center
        imageView.image = UIImage(named: "vn")
//        imageView.contentMode = .scaleAspectFill
        
//        dropShadow1()
//        dropShadow2()
//        dropShadow3()
//        dropShadow4()
        vd5Shadow()
        
    }

    func dropShadow1() {
        // Cho phép layer hiển thị đè ra ngoài bounds của view
        imageView.layer.masksToBounds = false
        
        // Set các thuộc tính đổ bóng
        // Màu của shadow
        imageView.layer.shadowColor = UIColor.black.cgColor
        // Độ mờ của Shadow
        imageView.layer.shadowOpacity = 0.7
        // Vị trí của shadow
//        imageView.layer.shadowOffset = .init(width: 3, height: 3)
        imageView.layer.shadowOffset = .init(width: 10, height: 20)
//        imageView.layer.shadowOffset = .zero    // CGSize(0, 0)
        // Bo tròn shadow
        imageView.layer.shadowRadius = 16
    }
    
    func dropShadow2() {
        view.addSubview(tempButton)
        tempButton.frame = .init(x: 0, y: 0, width: 200, height: 50)
        tempButton.center = view.center
        tempButton.setTitle("Next", for: .normal)
        tempButton.backgroundColor = .black
        
        // Tạo shadow trên layer sau đó add vào layer của view
        
        imageView.layer.masksToBounds = false
//        imageView.clipsToBounds = true
        
        // Tạo layer
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath(roundedRect: imageView.bounds, cornerRadius: 16)
        
        // Đổ màu ở giữa layer của view
        shadowLayer.fillColor = UIColor.green.cgColor
        shadowLayer.shadowOffset = .init(width: 0, height: 0)    // .zero
        shadowLayer.shadowColor = UIColor.systemBlue.cgColor
        shadowLayer.opacity = 0.8
        shadowLayer.shadowRadius = 16
        
        shadowLayer.path = shadowPath.cgPath
        
        // Add layer vào layer của view
        tempButton.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func dropShadow3() {
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath()
        
        shadowPath.move(to: CGPoint(x: imageView.bounds.minX, y: imageView.bounds.maxY+10))
        shadowPath.addLine(to: CGPoint(x: imageView.bounds.maxX, y: imageView.bounds.maxY+10))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX+30, y: imageView.bounds.maxY+30))
        shadowPath.addLine(to: .init(x: imageView.bounds.minX+30, y: imageView.bounds.maxY+30))
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.6
        
        shadowLayer.shadowPath = shadowPath.cgPath
        imageView.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func dropShadow4() {
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath(ovalIn: CGRect(x: imageView.bounds.minX, y: imageView.bounds.maxY+10, width: imageView.bounds.width, height: 20))
        
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.6
        
        shadowLayer.shadowPath = shadowPath.cgPath
        imageView.layer.insertSublayer(shadowLayer, at: 0)

    }
    
    func vd1Shadow() {
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath()
        
        shadowPath.move(to: .init(x: imageView.bounds.minX, y: imageView.bounds.maxY))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX, y: imageView.bounds.maxY))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX, y: imageView.bounds.minY))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX+80, y: imageView.bounds.minY+20))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX+80, y: imageView.bounds.minY+100))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX+80-100, y: imageView.bounds.minY+100))
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.6
        
        shadowLayer.shadowPath = shadowPath.cgPath
        imageView.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func vd2Shadow() {
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath()
        
        shadowPath.move(to: .init(x: imageView.bounds.minX, y: imageView.bounds.minY))
        shadowPath.addLine(to: .init(x: imageView.bounds.minX+50, y: imageView.bounds.minY-80))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX+50, y: imageView.bounds.minY-80))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX+50, y: imageView.bounds.minY-60))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX, y: imageView.bounds.maxY))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX, y: imageView.bounds.minY))
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.6
        
        shadowLayer.shadowPath = shadowPath.cgPath
        imageView.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func vd3Shadow() {
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath()
        
        shadowPath.move(to: .init(x: imageView.bounds.minX, y: imageView.bounds.maxY+5))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX, y: imageView.bounds.maxY+5))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX-10, y: imageView.bounds.maxY+50))
        shadowPath.addLine(to: .init(x: imageView.bounds.minX-50, y: imageView.bounds.maxY+50))
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.6
        
        shadowLayer.shadowPath = shadowPath.cgPath
        imageView.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func vd4Shadow() {
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath()
        
        shadowPath.move(to: .init(x: imageView.bounds.minX, y: imageView.bounds.maxY+5))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX, y: imageView.bounds.maxY+5))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX+20, y: imageView.bounds.maxY+50))
        shadowPath.addLine(to: .init(x: imageView.bounds.minX-20, y: imageView.bounds.maxY+50))
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.6
        
        shadowLayer.shadowPath = shadowPath.cgPath
        imageView.layer.insertSublayer(shadowLayer, at: 0)
    }

    func vd5Shadow() {
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath()
        
        shadowPath.move(to: .init(x: imageView.bounds.maxX, y: imageView.bounds.maxY))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX, y: imageView.bounds.maxY/2))
        shadowPath.addLine(to: .init(x: imageView.bounds.maxX+40, y: imageView.bounds.maxY/2))
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.6
        
        shadowLayer.shadowPath = shadowPath.cgPath
        imageView.layer.insertSublayer(shadowLayer, at: 0)
    }
    
}

