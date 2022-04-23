//
//  ViewController.swift
//  vdB8
//
//  Created by Nguyễn Anh Tú on 07/04/2022.
//

// Viết chương trình bấm giờ, với số giây 0<s<60, thời gian người nhập từ bàn phím. Buttom bấm giờ bắt đầu giảm dần về 0 thi dừng lại

import UIKit

class ViewController: UIViewController {
    
    let secondLabel: UILabel = UILabel()
   
    let nhapTextFile: UITextField = UITextField()
    
    let setButton: UIButton = UIButton()
    
    var timer: Timer!
    
    var seconds = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(secondLabel)
        view.addSubview(nhapTextFile)
        view.addSubview(setButton)
       
        secondLabel.frame = .init(x: 0, y: 0, width: 80, height: 80)
        secondLabel.center = view.center
        secondLabel.backgroundColor = .brown
        secondLabel.textAlignment = .center
        secondLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        secondLabel.text = "00"
        secondLabel.clipsToBounds = true
        secondLabel.layer.cornerRadius = 20
        
        
        nhapTextFile.backgroundColor = .brown
        nhapTextFile.textAlignment = .center
        nhapTextFile.placeholder = "Nhập giây"
        nhapTextFile.frame = .init(x: 0, y: secondLabel.frame.minY-100, width: 300, height: 50)
        nhapTextFile.center.x = secondLabel.center.x
        nhapTextFile.keyboardType = .numberPad
        nhapTextFile.clipsToBounds = true
        nhapTextFile.layer.cornerRadius = 20
        
        setButton.frame = .init(x: 0, y: secondLabel.frame.maxY+100, width: 200, height: 50)
        setButton.setTitle("Bấm giây", for: .normal)
        setButton.backgroundColor = .brown
        setButton.center.x = view.center.x
        setButton.clipsToBounds = true
        setButton.layer.cornerRadius = 20
        setButton.addTarget(self, action: #selector(bamGio), for: .touchUpInside)
        
    }

    @objc func bamGio() {
        seconds = Int(nhapTextFile.text ?? "") ?? 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.seconds -= 1
            self.secondLabel.text = "\(self.seconds)"
            if self.seconds == 0 {
                self.timer.invalidate()
            }
        })
    }

}

