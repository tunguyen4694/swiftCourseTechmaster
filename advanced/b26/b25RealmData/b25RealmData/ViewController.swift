//
//  ViewController.swift
//  b25RealmData
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let item = Item()
//        item.name = "Brian"
//        item.content = "Love Mia"

//        DBManager.sharedInstance.addData(item)
        
        let itemDelete = Item()
        itemDelete.ID = "902B3B80-CFFF-4BF5-914C-235F075D4D36"
        itemDelete.name = "Brian"
        itemDelete.content = "Love Mia"
        
        DBManager.sharedInstance.deleteAnObject(itemDelete)
//        DBManager.sharedInstance.deleteAll() 
        let result = DBManager.sharedInstance.getData()

        for item in result {
            print("ID \(item.ID) Name \(item.name), content \(item.content)")
        }
    }



}

