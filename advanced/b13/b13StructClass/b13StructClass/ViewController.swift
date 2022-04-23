//
//  ViewController.swift
//  b13StructClass
//
//  Created by Nguyễn Anh Tú on 21/04/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

class Person {
var name = ""
var adress: String?

init(name: String, adress: String? = nil) {
    self.name = name
    self.adress = adress
}

func info() -> String{
    let adress = adress ?? "khong co dia chi"
    return "name: \(name) \(adress)"
}

}

func example() -> String {
var person1 = Person(name: "Viet")
var person2 = Person(name: "Thai", adress: "BacGiang")
person2.adress = person1.adress

return person1.info()
}
