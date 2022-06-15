#  <#Title#>

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
