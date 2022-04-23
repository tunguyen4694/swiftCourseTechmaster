//
//  ViewController.swift
//  b9Watch
//
//  Created by Nguyễn Anh Tú on 12/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let oClockImage = UIImageView()
    let hourMarkImage = UIImageView()
    let minuteMarkImage = UIImageView()
    let secondMarkImage = UIImageView()
    
    var timer: Timer!
    var rotate = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(oClockImage)
        oClockImage.image = UIImage(named: "oClock")
        oClockImage.frame = .init(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxX)
        oClockImage.center = view.center
        
        view.addSubview(hourMarkImage)
        view.addSubview(minuteMarkImage)
        view.addSubview(secondMarkImage)

        hourMarkImage.image = UIImage(named: "hourMark")
        hourMarkImage.frame = .init(x: 0, y: 0, width: 200, height: 400)
        hourMarkImage.center = oClockImage.center
        hourMarkImage.clipsToBounds = true

        minuteMarkImage.image = UIImage(named: "minuteMark")
        minuteMarkImage.frame = .init(x: 0, y: 0, width: 200, height: 400)
        minuteMarkImage.center = oClockImage.center
        minuteMarkImage.clipsToBounds = true
        
        secondMarkImage.image = UIImage(named: "secondMark")
        secondMarkImage.frame = .init(x: 0, y: 0, width: 200, height: 400)
        secondMarkImage.center = oClockImage.center
        secondMarkImage.clipsToBounds = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.getTime()
        })
        
    }

    func getTime() {
        let currentDate = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: currentDate)
        let minute = calendar.component(.minute, from: currentDate)
        let second = calendar.component(.second, from: currentDate)

        let radS = .pi/30 * CGFloat(second)
        
        let radM = .pi/30 * CGFloat(minute)
        
        let radH = .pi/6 * CGFloat(hour) + .pi/360 * CGFloat(minute)
        
        self.secondMarkImage.transform = CGAffineTransform(rotationAngle: radS)
    
        self.minuteMarkImage.transform = CGAffineTransform(rotationAngle: radM)
        
        self.hourMarkImage.transform = CGAffineTransform(rotationAngle: radH)
                
            
        
    }

}

