//
//  ViewController.swift
//  b8DemoDateTime
//
//  Created by Nguyễn Anh Tú on 07/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let minuteLabel: UILabel = UILabel()
    let hourLabel: UILabel = UILabel()
    let secondLabel: UILabel = UILabel()
    
    let temLabel1: UILabel = UILabel()
    let temLabel2: UILabel = UILabel()
    
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(minuteLabel)
        view.addSubview(hourLabel)
        view.addSubview(secondLabel)
        view.addSubview(temLabel1)
        view.addSubview(temLabel2)
        
        minuteLabel.frame = .init(x: 0, y: 0, width: 80, height: 80)
        minuteLabel.center = view.center
        minuteLabel.backgroundColor = .brown
        minuteLabel.textAlignment = .center
        minuteLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        minuteLabel.text = "00"
        
        temLabel1.text = ":"
        temLabel1.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        temLabel1.frame = .init(x: minuteLabel.frame.minX-30, y: minuteLabel.frame.minY, width: 30, height: 80)
        temLabel1.center.y = minuteLabel.center.y
        temLabel1.textAlignment = .center
        
        hourLabel.frame = .init(x: temLabel1.frame.minX-80, y: temLabel1.frame.minY, width: 80, height: 80)
        hourLabel.backgroundColor = .brown
        hourLabel.textAlignment = .center
        hourLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        hourLabel.text = "00"
        
        temLabel2.text = ":"
        temLabel2.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        temLabel2.frame = .init(x: minuteLabel.frame.maxX, y: minuteLabel.frame.minY, width: 30, height: 80)
        temLabel2.textAlignment = .center
        
        secondLabel.frame = .init(x: temLabel2.frame.maxX, y: temLabel2.frame.minY, width: 80, height: 80)
        secondLabel.backgroundColor = .brown
        secondLabel.textAlignment = .center
        secondLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        secondLabel.text = "00"
        
        getTime()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.getTime()
        })
    }

    func getTime() {
        let currentDate = Date()
        print(currentDate)
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: currentDate)
//        print(hour)
        if hour < 10 {
            hourLabel.text = "0\(hour)"
        } else {
            hourLabel.text = String(hour)
        }
        
        let minute = calendar.component(.minute, from: currentDate)
        if minute < 10 {
            minuteLabel.text = "0\(minute)"
        } else {
            minuteLabel.text = String(minute)
        }
        
        let second = calendar.component(.second, from: currentDate)
        if second < 10 {
            secondLabel.text = "0\(second)"
        } else {
            secondLabel.text = String(second)
        }
        
    }
    
}

