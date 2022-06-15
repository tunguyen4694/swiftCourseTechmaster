//
//  DBManager.swift
//  b25RealmData
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//

import Foundation
import RealmSwift

class DBManager {
    private var database: Realm
    static let sharedInstance = DBManager()
    
    private init() {
        database = try!Realm()
    }
    
    func addData(_ object: Item) {
        try! database.write({
            object.ID = UUID().uuidString
            database.add(object)
        })
    }
    
    func getData() -> Results<Item> {
        let results: Results<Item> = database.objects(Item.self)
        return results
    }
    
    func deleteAnObject(_ object: Item) {
        try! database.write({
            let puppies = database.objects(Item.self).where {
                $0.ID == object.ID
            }
            database.delete(puppies)
        })
    }
    
    func deleteAll() {
        try! database.write({
            database.deleteAll()
        })
    }
}
