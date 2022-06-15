//
//  User+CoreDataProperties.swift
//  b25CoreDataExample
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var favorites: NSSet?

}

// MARK: Generated accessors for favorites
extension User {

    @objc(addFavoritesObject:)
    @NSManaged public func addToFavorites(_ value: Favorite)

    @objc(removeFavoritesObject:)
    @NSManaged public func removeFromFavorites(_ value: Favorite)

    @objc(addFavorites:)
    @NSManaged public func addToFavorites(_ values: NSSet)

    @objc(removeFavorites:)
    @NSManaged public func removeFromFavorites(_ values: NSSet)

}

extension User : Identifiable {
    static func createNewUser(_ id: Int16, name: String?) -> User? {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: AppDelegate.managerObiectContext!) as! User
        user.id = id
        user.name = name
        
        do {
            try AppDelegate.managerObiectContext?.save()
        } catch {
            print("Can't add user. Error: \(error.localizedDescription)")
        }
        return user
    }
    
    static func getAll() -> [User] {
        var result = [User]()
        let moc = AppDelegate.managerObiectContext
        
        do {
            result = try moc!.fetch(User.fetchRequest()) as! [User]
        } catch {
            print("Can't fetch data. Error: \(error.localizedDescription) ")
        }
        return result
    }
}
