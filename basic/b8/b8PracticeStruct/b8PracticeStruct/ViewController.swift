//
//  ViewController.swift
//  b8PracticeStruct
//
//  Created by Nguyễn Anh Tú on 07/04/2022.
//

import UIKit

// Tạo 1 danh sách các nước Country (Name, Flag, Area, Population)
// 3 Label, 1 UIImageView, 1 Button
// Struct/Class: Country
// Tạo 1 giao diện, khi ấn button thì random in ra thông tin của 1 nước ra màn hình
// Gợi ý: Lấy random 1 phần tử trong mảng: array.randomElement()

class ViewController: UIViewController {

    let nameLabel: UILabel = UILabel()
    let areaLabel: UILabel = UILabel()
    let populationLabel: UILabel = UILabel()
    let flagImage: UIImageView = UIImageView()
    let randomButton: UIButton = UIButton()
    
    struct Country {
        init(name: String, flag: UIImage, area: Float, population: Float) {
            self.name = name
            self.flag = flag
            self.area = area
            self.population = population
        }
        
        var name: String
        var flag: UIImage
        var area: Float
        var population: Float
    }
    
    let arrCountry: [Country] = [Country(name: "Vietnam", flag: UIImage(named: "vn")!, area: 331690, population: 97.34), Country(name: "France", flag: UIImage(named: "fr")!, area: 543940, population: 67.39), Country(name: "Americal", flag: UIImage(named: "us")!, area: 9834000, population: 329.5) ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(nameLabel)
        view.addSubview(areaLabel)
        view.addSubview(populationLabel)
        view.addSubview(flagImage)
        view.addSubview(randomButton)
        
        nameLabel.frame = .init(x: 0, y: 150, width: 300, height: 50)
        nameLabel.center.x = view.center.x
        nameLabel.textAlignment = .center
        
        areaLabel.frame = .init(x: 0, y: 200, width: 300, height: 50)
        areaLabel.center.x = view.center.x
        areaLabel.textAlignment = .center
        
        populationLabel.frame = .init(x: 0, y: 250, width: 300, height: 50)
        populationLabel.center.x = view.center.x
        populationLabel.textAlignment = .center
        
        flagImage.frame = .init(x: 0, y: 350, width: 300, height: 200)
        flagImage.center.x = view.center.x
        
        randomButton.frame = .init(x: 0, y: 700, width: 100, height: 50)
        randomButton.center.x = view.center.x
        randomButton.setTitle("Random", for: .normal)
        randomButton.backgroundColor = .lightGray

        randomButton.addTarget(self, action: #selector(actionRandom(_:)), for: .touchUpInside)
        
    }

    @objc func actionRandom(_ sender: UIButton) {
        let randomItem = arrCountry.randomElement()
        flagImage.image = randomItem?.flag
        nameLabel.text = randomItem?.name
        areaLabel.text = "\(randomItem?.area ?? 0) km2"
        populationLabel.text = "\(randomItem?.population ?? 0) triệu dân"
    }

}

