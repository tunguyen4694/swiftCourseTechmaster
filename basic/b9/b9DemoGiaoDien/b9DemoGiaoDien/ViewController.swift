//
//  ViewController.swift
//  b9DemoGiaoDien
//
//  Created by Nguyễn Anh Tú on 12/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let containerView = UIView()
    let priImage = UIImageView()
    let label1 = UILabel()
    let image1 = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let sliderBar = UISlider()
    let minLabel = UILabel()
    let maxLabel = UILabel()
    
    let image4 = UIImageView()
    let image5 = UIImageView()
    let image6 = UIImageView()
    let image7 = UIImageView()
    let image8 = UIImageView()
    
    let fireImage = UIImageView()
    
    let lineView = UIView()
    let upImage = UIImageView()
    let upButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(label1)
        label1.frame = .init(x: 0, y: 50, width: 200, height: 50)
        label1.center.x = view.center.x
        label1.text = "Now Playing"
        label1.font = UIFont.boldSystemFont(ofSize: 16)
        label1.textAlignment = .center
        
        view.addSubview(image1)
        image1.frame = .init(x: 30, y: 50, width: 50, height: 50)
        image1.image = UIImage(systemName: "chevron.down.circle")
        
        view.addSubview(image2)
        image2.frame = .init(x: view.frame.maxX-80, y: 50, width: 50, height: 50)
        image2.image = UIImage(systemName: "square.and.arrow.up.circle")
        
        view.addSubview(containerView)
        containerView.frame = .init(x: 0, y: 120, width: 300, height: 300)
        containerView.center.x = view.center.x
//        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 40
        containerView.backgroundColor = .systemPink
//        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = .init(width: 0, height: 20)
        containerView.layer.shadowRadius = 40
        
        view.addSubview(image3)
        image3.frame = .init(x: 0, y: 0, width: 300, height: 300)
        image3.center = containerView.center
        image3.image = UIImage(named: "b9")
        image3.clipsToBounds = true
        image3.layer.cornerRadius = 40
        
        view.addSubview(label2)
        label2.frame = .init(x: 0, y: 460, width: 150, height: 30)
        label2.center.x = view.center.x
        label2.backgroundColor = #colorLiteral(red: 0.8678469314, green: 0.8678469314, blue: 0.8678469314, alpha: 1)
        label2.text = "     #12 TOP CHART"
        label2.font = UIFont(name: "Arial", size: 12)
        label2.textAlignment = .center
        label2.clipsToBounds = true
        label2.layer.cornerRadius = 15
        
        view.addSubview(fireImage)
        fireImage.frame = .init(x: label2.frame.minX+15, y: 467, width: 16, height: 16)
        fireImage.image = UIImage(systemName: "flame.fill")
        fireImage.tintColor = .systemOrange
        
        view.addSubview(label3)
        label3.frame = .init(x: 0, y: 500, width: 200, height: 50)
        label3.center.x = view.center.x
        label3.textAlignment = .center
        label3.text = "Summer Paradise"
        label3.font = UIFont.boldSystemFont(ofSize: 20)
        
        view.addSubview(label4)
        label4.frame = .init(x: 0, y: 540, width: 200, height: 30)
        label4.center.x = view.center.x
        label4.textAlignment = .center
        label4.text = "SIMPLE PLAN"
        label4.font = UIFont(name: "Arial", size: 12)
        label4.layer.opacity = 0.5
        
        view.addSubview(sliderBar)
        sliderBar.frame = .init(x: 0, y: 600, width: 350, height: 30)
        sliderBar.center.x = view.center.x
        sliderBar.minimumTrackTintColor = .black
//        sliderBar.maximumTrackTintColor = .lightGray
        sliderBar.thumbTintColor = .white
        sliderBar.minimumValue = 0.00
        sliderBar.maximumValue = 3.40
        sliderBar.value = 1.46
        
        view.addSubview(minLabel)
        minLabel.frame = .init(x: sliderBar.frame.minX, y: sliderBar.frame.maxY+10, width: 50, height: 20)
        minLabel.text = "1:46"
        minLabel.layer.opacity = 0.5
        minLabel.textAlignment = .left
        
        view.addSubview(maxLabel)
        maxLabel.frame = .init(x: sliderBar.frame.maxX-50, y: sliderBar.frame.maxY+10, width: 50, height: 20)
        maxLabel.text = "3:40"
        maxLabel.layer.opacity = 0.5
        maxLabel.textAlignment = .right
        
        view.addSubview(image4)
        image4.frame = .init(x: 30, y: 700, width: 30, height: 30)
        image4.image = UIImage(systemName: "shuffle")
        image4.tintColor = .black
        image4.layer.opacity = 0.5
        
        view.addSubview(image5)
        image5.frame = .init(x: 100, y: 700, width: 30, height: 30)
        image5.image = UIImage(systemName: "backward.end.fill")
        image5.tintColor = .black
        image5.layer.opacity = 0.5
        
        view.addSubview(image6)
        image6.frame = .init(x: 170, y: 680, width: 80, height: 80)
        image6.center.y = image5.center.y
        image6.center.x = view.center.x
        image6.image = UIImage(systemName: "play.circle.fill")
        image6.tintColor = .black
//        image6.layer.masksToBounds = false
        image6.layer.shadowColor = UIColor.black.cgColor
        image6.layer.shadowOffset = CGSize(width: 0, height: 10)
        image6.layer.shadowRadius = 20
        image6.layer.shadowOpacity = 0.3
        
        view.addSubview(image7)
        image7.frame = .init(x: view.frame.maxX-130, y: 700, width: 30, height: 30)
        image7.image = UIImage(systemName: "forward.end.fill")
        image7.tintColor = .black
        image7.layer.opacity = 0.5
        
        view.addSubview(image8)
        image8.frame = .init(x: view.frame.maxX-60, y: 700, width: 30, height: 30)
        image8.image = UIImage(systemName: "repeat")
        image8.tintColor = .black
        image8.layer.opacity = 0.5
        
        view.addSubview(lineView)
        lineView.frame = .init(x: 0, y: 780, width: view.frame.width, height: 0.5)
        lineView.backgroundColor = .lightGray
        lineView.layer.opacity = 0.7
        
        view.addSubview(upImage)
        upImage.frame = .init(x: 0, y: 800, width: 20, height: 10)
        upImage.center.x = view.center.x
        upImage.image = UIImage(systemName: "chevron.up")
        
        view.addSubview(upButton)
        upButton.frame = .init(x: 0, y: 830, width: 400, height: 16)
        upButton.center.x = view.center.x
        upButton.backgroundColor = .clear
        upButton.setTitle("Swipe for music lyric", for: .normal)
        upButton.setTitleColor(.black, for: .normal)
        upButton.layer.opacity = 0.7
        
        
    }


}

