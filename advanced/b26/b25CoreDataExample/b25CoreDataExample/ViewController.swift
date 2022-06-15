//
//  ViewController.swift
//  b25CoreDataExample
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//

import UIKit

class ViewController: UIViewController {

//    let user1 = User.createNewUser(1, name: "Tu")
//    let favorite1 = Favorite.createNewFavorite("Travel", describe: "France")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        getData()
    }


    func addData() {
        let user = User.createNewUser(1, name: "Tu")
        var favorites = Set<Favorite>()
        
        if let travel = Favorite.createNewFavorite("Travel", describe: "Like Sea") {
            travel.user = user
            favorites.insert(travel)
        }
        if let music = Favorite.createNewFavorite("Listen music", describe: "EDM and Pop") {
            music.user = user
            favorites.insert(music)
        }
        
        if let sport = Favorite.createNewFavorite("Gym", describe: "Tay, chan, nguc, bung, xo, vai") {
            sport.user = user
            favorites.insert(sport)
        }
        
        user?.addToFavorites(favorites as NSSet)
    }
    
    func getData() {
        let users = User.getAll()
        if (users.count == 0) {
            print("Khong co user")
        }
        for item in users {
            print(item.name, item.favorites)
        }
    }
}

