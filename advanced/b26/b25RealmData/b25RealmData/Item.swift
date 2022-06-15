//
//  Item.swift
//  b25RealmData
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var ID = ""
    @objc dynamic var name = ""
    @objc dynamic var content = ""
    
    // config key
    override static func primaryKey() -> String {
        return "ID"
    }
}
