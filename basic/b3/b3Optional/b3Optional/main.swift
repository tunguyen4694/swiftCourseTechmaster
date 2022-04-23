//
//  main.swift
//  b3Optional
//
//  Created by Nguyễn Anh Tú on 07/04/2022.
//

import Foundation

//print("Hello, World!")

// MARK: Optional

var name: String    // Biến thường
var firstName: String?  // Biến optional
name = "Tu"
firstName = "Nguyen"
print(name, firstName as Any)


// MARK: Optional Binding if let
if let newFirstName = firstName {
    print("\(newFirstName) \(name)")
} else {
    print("firstName không mang giá trị, chỉ có tên là \(name)")
}


// MARK: Optional Binding guard let
func kiemTra(name: String?, firstName: String?) {
    guard let secondFristName = firstName else {
        print("firstName bị nill khi kiểm tra bằng guard let")
        return
    }
    print("firstName có giá trị là \(secondFristName)")
}
kiemTra(name: name, firstName: firstName)

// MARK: Nil Coalescing - Rất hay sử dụng
print("Nil Coalescing Operator \(firstName ?? "") \(name)")


// MARK: Unconditional Unwrapping
print("firstName là \(firstName!)") // Chỉ dùng khi chắc hắn biến optional có giá trị


// MARK: struct
struct Person {
    var id: String
    var name: String
    var age: Int?
    var address: String?
    var favorite: Favorite?
}

struct Favorite {
    var id: Int?
    var favorites: [String]
}

var personA = Person(id: "1", name: "Tu", age: 29, address: "Nam Dinh") // 1 instance
var personB = Person(id: UUID().uuidString, name: "Trang")   // UUID tạo id tự động

print(personA, personB)
print("Person A: name - \(personA.name)")

personB.address = "Thanh Hoa"

let favorite = ["Read", "Listen"]
personA.favorite = Favorite(id: 1, favorites: favorite)
print(personA.favorite?.id) // optional chaining


// MARK: class
class House {
    let id: Int
    var area: Float?
    var numberHouse: Int?
    var address: String = ""

    init(_ id: Int, _ area: Float?, _ numberHouse: Int?, _ address: String) {
        self.id = id
        self.area = area
        self.numberHouse = numberHouse
        self.address = address
    }
    
    init(id: Int) {
        self.id = id
    }
    
    init(id: Int, area: Float) {
        self.id = id
        self.area = area
    }
}

var vinHouse = House(1, 20, 2, "VN")
var sunHouse = House(id: 2, area: 63.35)

print(vinHouse.id, vinHouse.area, sunHouse.id, sunHouse.area)
