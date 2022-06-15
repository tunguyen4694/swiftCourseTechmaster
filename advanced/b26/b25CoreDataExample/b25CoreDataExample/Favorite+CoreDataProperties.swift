//
//  Favorite+CoreDataProperties.swift
//  b25CoreDataExample
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var name: String?
    @NSManaged public var describe: String?
    @NSManaged public var user: User?

}

extension Favorite : Identifiable {
    static func createNewFavorite(_ name: String, describe: String?) -> Favorite? {
        let favorite = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: AppDelegate.managerObiectContext!) as! Favorite
        favorite.name = name
        favorite.describe = describe
        
        do {
            try AppDelegate.managerObiectContext?.save()
        } catch {
            print("Can't add favorite. Error: \(error.localizedDescription)")
        }
        return favorite
    }
    
    static func getAll() -> [Favorite] {
        var result = [Favorite]()
        let moc = AppDelegate.managerObiectContext
        
        do {
            result = try moc!.fetch(Favorite.fetchRequest()) as! [Favorite]
        } catch {
            print("Can't fetch data. Error: \(error.localizedDescription) ")
        }
        return result
    }
}
