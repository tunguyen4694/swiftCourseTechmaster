//
//  main.swift
//  b1SwiftBasic
//
//  Created by Nguyễn Anh Tú on 03/04/2022.
//

import Foundation

//print("Hello, World!")

// MARK: Khai báo biến

// Khai báo và gán giá trị cho biến
//var text: String = "Hello, I'm Swift"

// Khai báo không gán giá trị cho biến
//var number: Int

// Khai báo hằng
//let pi = 3.14

//print(text)
//print(pi)

// MARK: Xuất ra màn hình Console
//let name: String = "Tú"
//var age: Int = 28
//print("Hello everyone, I'm \(name) and I'm \(age) years old")
//print("Hi there", terminator: ", ")
//print("I'm \(name) and I'm \(age) years old")
//
//var x = 5
//var y = 2
//var z = x/y
//print(z)    // Kq: z = 2 (x = 5.0 và y = 2.0 thì z = 2.5)

// MARK: Toán tử gán
//var num = 6
//num += 1    // num = num + 1

//num /= 3    // num = num / 3

// MARK: Toán tử Ternary (Biểu thức điều kiện)
//let a = 10
//let b = 15

//a > b ? print("a lớn hơn b") : print("b lớn hơn a")

// MARK: Chuỗi và mảng các kí tự
//let dogCharacter: [Character] = ["D", "o", "g"]
//let dogString = String(dogCharacter)    // Ép kiểu
//print(dogCharacter)
//print(dogString)

//for item in dogCharacter {
//    print(item)
//    print(item, terminator: " - ")
//}
//print()

// MARK: Các hàm chuỗi và kí tự
//let stringDay = "Saturday"
//let stringDate = "19/03/2022"

// MARK: isEmpty: Kiểm tra chuỗi có trống hay không
//print(stringDay.isEmpty)
//print(stringDate.isEmpty)
//print(stringDay + " " + stringDate)

// MARK: Dùng appending để nối chuỗi
//let appendString = stringDay.appending(stringDate).appending("Today")
//print(appendString)


// MARK: uppercased() Viết hoa tất cả kí tự, lowercased() Viết thường tất cả kí tự
//print(stringDay.uppercased())
//print(stringDay.lowercased())


// MARK: prefix, suffix: Lấy ra các phần tử từ đầu hoặc từ cuối chuỗi
//print(stringDay.prefix(3))
//print(stringDay.suffix(4))


// MARK: contains: Kiểm tra chuỗi có chứa một chuỗi khác không
//print(stringDay.contains("Sat"))
//print(stringDay.contains("SAT"))

// MARK: reversed: Đão ngược chuỗi
//let s = stringDate.reversed()
//print(String(s))    // Đảo ngược xong phải ép kiểu
//print(String(stringDay.reversed()))

// MARK: Khai báo một tập hợp [mảng] String
//let arrayString = ["This", "is", "Swift"]


// MARK: joined: Nối thành 1 chuỗi
//print(arrayString.joined(separator: " "))


// MARK: components: Cẳt chuỗi thành 1 mảng
//let stringExample: String = "Hello world, I'm Swift 5.6"
//print(stringExample.components(separatedBy: " "))

// MARK: Nhập dữ liệu từ bàn phím
//var stringInput: String
//print("Hãy nhập tên của bạn: ")
//stringInput = readLine() ?? ""
//print("Tên của bạn là \(stringInput)")
//print("Nhập tuổi của bạn: ")
//var ageInt: Int = Int(readLine() ?? "") ?? 0
//print("Tuổi của bạn là \(ageInt)")

// MARK: BT nhập vào 2 số nguyên m và n. Yêu cầu tính tổng, hiệu, tích, thương của 2 số đó rồi in ra màn hình

//print("Nhập vào số m: ", terminator: " ")
//var m = Float(readLine() ?? "") ?? 0
//print("Nhập vào số n: ", terminator: " ")
//var n = Float(readLine() ?? "") ?? 0
//print("Tổng 2 số m + n = \(m+n)")
//print("Hiệu 2 số m - n = \(m-n)")
//print("Tích 2 số m * n = \(m*n)")
//n == 0 ? print("m không chia được cho n") : print("Thương 2 số m / n = \(m/n)")

// MARK: BT nhập vào họ và tên của bạn, in ra từng ký tự trong tên của bạn
//print("Nhập họ và tên của bạn: ", terminator: "")
//var hoTen = readLine() ?? ""
//for i in hoTen {
//    print(i, terminator: ", ")
//}

// Lấy ra riêng họ và tên
//var arrName = hoTen.components(separatedBy: " ")
//print(arrName)
//print("Họ: \(arrName.first ?? "")")
//print("Tên: \(arrName.last ?? "")")

// MARK: BT nhập vào 3 cạnh tam giác, tính chu vi và diện tích của tam giác đó

//print("Nhập vào 3 cạnh tam giác: ")
//print("Cạnh a: ", terminator: "")
//var a = Float(readLine() ?? "") ?? 0
//print("Cạnh b: ", terminator: "")
//var b = Float(readLine() ?? "") ?? 0
//print("Cạnh c: ", terminator: "")
//var c = Float(readLine() ?? "") ?? 0
//
//if a + b > c && b + c > a && a + c > b {
//    print("Chu vi tam giác là \(a+b+c)")
//    let p = (a+b+c)/2
//    print("Diện tích tam giác là \(sqrt(p*(p-a)*(p-b)*(p-c)))")
//} else {
//    print("3 cạnh a, b, c không tạo thành tam giác")
//}


// MARK: BT nhập vào 3 số a, b, c tương ứng với phương trình bậc 2 ax^2 + bx = c
/**
 Tính delta = b^2 - 4ac
 Nếu delta > 0, PT có 2 nghiệm: x1 = (-b + căn bậc 2 (delta)) / 2a   và   x2 = (-b - căn bậc 2 (delta)) / 2a
 Nếu delta = 0, PT có 1 nghiệm kép: x1 = x2 = -b/2a
 Nếu delta < 0, PT vô nghiệm
 */

//print("Cho phương trình bậc 2: ax^2 + bx = c")
//print("Nhập a: ", terminator: "")
//var a = Float(readLine() ?? "") ?? 0
//print("Nhập b: ", terminator: "")
//var b = Float(readLine() ?? "") ?? 0
//print("Nhập c: ", terminator: "")
//var c = Float(readLine() ?? "") ?? 0
//
//let delta = b*b - 4*a*c
//if delta > 0 {
//    print("PT có 2 nghiệm: ")
//    print("x1 = \((-b + sqrt(delta))/(2*a))")
//    print("x2 = \((-b - sqrt(delta))/(2*a))")
//} else if delta == 0 {
//    print("PT có nghiệm kép: ")
//    print("x1 = x2 = \(-b/(2*a))")
//} else {
//    print("PT vô nghiệm")
//}
