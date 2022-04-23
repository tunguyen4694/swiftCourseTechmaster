//
//  ViewController.swift
//  b6DemoControl
//
//  Created by Nguyễn Anh Tú on 05/04/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sliderBar: UISlider!
    
    let secondSlider: UISlider = UISlider()
    
    @IBOutlet weak var statusSwitch: UISwitch!
    
    let secondSwitch: UISwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: UISlider
        // Set màu cho slider hiển thị
        sliderBar.minimumTrackTintColor = .red
        sliderBar.maximumTrackTintColor = .black
        sliderBar.thumbTintColor = #colorLiteral(red: 1, green: 0.9805983588, blue: 0.1095897078, alpha: 1)
        sliderBar.backgroundColor = .cyan
        
        // Set value cho slider
        sliderBar.minimumValue = 0
        sliderBar.maximumValue = 10
        sliderBar.value = 2
        
        
        view.addSubview(secondSlider)
        secondSlider.frame = CGRect(x: 0, y: sliderBar.frame.maxY+32, width: 300, height: 50)
        secondSlider.center.x = view.center.x
        secondSlider.minimumTrackTintColor = .systemGreen
        secondSlider.maximumTrackTintColor = .blue
        secondSlider.thumbTintColor = .cyan
        secondSlider.backgroundColor = .gray
        
        secondSlider.addTarget(self, action: #selector(changeSecondSlider(sender:)), for: .valueChanged)
        
        
        // MARK: UISwitch
        statusSwitch.isOn = true    //false nếu là off
        print(statusSwitch.isOn)
        statusSwitch.thumbTintColor = .white
        statusSwitch.onTintColor = .systemGreen
        
        statusSwitch.addTarget(self, action: #selector(changeStatusSwitch(sender:)), for: .valueChanged)
        
        view.addSubview(secondSwitch)
        secondSwitch.frame = CGRect(x: statusSwitch.frame.minX, y: statusSwitch.frame.maxY+50, width: 50, height: 30)
        secondSwitch.addTarget(self, action: #selector(changeStatusSwitch(sender:)), for: .valueChanged)
    }
    
    @objc func changeSecondSlider(sender: UISlider) {
        sliderBar.value = sender.value
    }

    @IBAction func actionChangeValue(_ sender: UISlider) {
        print(sender.value)
    }
    
    @objc func changeStatusSwitch(sender: UISwitch) {
        print(sender.isOn)
    }
    
    @IBAction func actionChangeSwitch(_ sender: UISwitch) {
        print(sender.isOn)
    }
    
}

