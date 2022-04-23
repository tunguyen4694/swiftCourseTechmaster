//
//  ViewController.swift
//  vd1B7
//
//  Created by Nguyễn Anh Tú on 05/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let titleLabel: UILabel = UILabel()
    let genderSwitch: UISwitch = UISwitch()
    let genderLabel: UILabel = UILabel()
    let weightSlider: UISlider = UISlider()
    let heightSlider: UISlider = UISlider()
    let weightLabel: UILabel = UILabel()
    let heightLabel: UILabel = UILabel()
    let bmiButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(titleLabel)
        view.addSubview(genderLabel)
        view.addSubview(genderSwitch)
        view.addSubview(weightSlider)
        view.addSubview(heightSlider)
        view.addSubview(weightLabel)
        view.addSubview(heightLabel)
        view.addSubview(bmiButton)
        
        titleLabel.text = "Tính chỉ số BMI: "
        titleLabel.frame = CGRect(x: 0, y: 50, width: 300, height: 50)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.center.x = view.center.x
        titleLabel.textAlignment = .center
        
        weightLabel.frame = CGRect(x: 0, y: titleLabel.frame.maxY+100, width: 300, height: 50)
        weightLabel.center.x = titleLabel.center.x
        weightLabel.backgroundColor = .systemGray
        weightLabel.text = "Cân nặng"
        
        weightSlider.maximumValue = 0
        weightSlider.maximumValue = 120
        weightSlider.frame = CGRect(x: 0, y: weightLabel.frame.maxY+32, width: 300, height: 50)
        weightSlider.center.x = weightLabel.center.x
        
        heightLabel.frame = CGRect(x: 0, y: weightSlider.frame.maxY+50, width: 300, height: 50)
        heightLabel.center.x = titleLabel.center.x
        heightLabel.backgroundColor = .systemGray
        heightLabel.text = "Chiều cao"
        
        heightSlider.maximumValue = 0
        heightSlider.maximumValue = 2
        heightSlider.frame = CGRect(x: 0, y: heightLabel.frame.maxY+32, width: 300, height: 50)
        heightSlider.center.x = heightLabel.center.x
        
        weightSlider.addTarget(self, action: #selector(actionWeightSlider(_:)), for: .valueChanged)
        
        heightSlider.addTarget(self, action: #selector(actionHeightSlider(_:)), for: .valueChanged)
        
        genderLabel.text = "Giới tính"
        genderLabel.frame = CGRect(x: 50, y: heightSlider.frame.maxY+100, width: 50, height: 50)
        
        genderSwitch.frame = CGRect(x: genderLabel.frame.maxX+50, y: heightSlider.frame.maxY+32, width: 50, height: 50)
        
        genderSwitch.center.y = genderLabel.center.y
//        genderSwitch.onTintColor = .cyan
//        genderSwitch.thumbTintColor = .white
        
        genderSwitch.addTarget(self, action: #selector(actionGenderSwitch(_:)), for: .valueChanged)
        
        bmiButton.setTitle("Tính BMI", for: .normal)
        bmiButton.frame = CGRect(x: 0, y: genderLabel.frame.maxY+50, width: 100, height: 50)
        bmiButton.center.x = view.center.x
        bmiButton.backgroundColor = .cyan
        
        bmiButton.addTarget(self, action: #selector(tinhBmi(_:)), for: .touchUpInside)
    }

    @objc func actionWeightSlider(_ sender: UISlider){
        weightLabel.text = String(format: "%.2f kg", sender.value)
    }
    
    @objc func actionHeightSlider(_ sender: UISlider){
        heightLabel.text = String(format: "%.2f m", sender.value)
    }
    
    @objc func actionGenderSwitch(_ sender: UISwitch){
        if sender.isOn == true {
            genderLabel.text = "Nam"
        } else {
            genderLabel.text = "Nữ"
        }
    }
    
    @objc func tinhBmi(_ sender: UIButton){
            let bmi = weightSlider.value/(2*heightSlider.value)
            print("Chỉ số BMI = \(bmi)")
        
        // UIAlertController: Hiển thị thông báo dưới dạng popup
        let alertController = UIAlertController(title: "Chỉ số BMI", message: "Chỉ số BMI: \(bmi)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("Ấn popup")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

