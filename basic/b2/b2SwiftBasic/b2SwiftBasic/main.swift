//
//  main.swift
//  b2SwiftBasic
//
//  Created by Nguyễn Anh Tú on 04/04/2022.
//

import Foundation

//print("Hello, World!")

// MARK: switch ... case ...
//let name = "Tu"
//switch name {
//case "Vu":
//    print("Hoc Sinh")
//case "Tu":
//    print("Hoc Sinh")
//case "Duy":
//    print("Hoc Sinh")
//case "Giang":
//    print("Giao Vien")
//default:
//    print("Khong Co")
//}

// MARK: Array là một tập hợp gồm các phần tử có cùng kiểu dữ liệu, vị trí phần tử đầu tiền là 0, vị trí phần tử cuối cùng là số phần tử -1



// MARK: Khai báo mảng
//var arrNumber1: [Int] = [0, 5, 6, 9, -5]
//var arrNumber2: [Float] = [] // Mảng rỗng không có phần tử
//var arrName: String
//var repeatArr = [String](repeating: "Nguyen Anh Tu", count: 5)  // Mảng gồm 5 phần từ có giá trị giống nhau

// MARK: Kiểm tra mảng có rỗng hay không
//print(arrNumber1.isEmpty)
//print(arrNumber2.isEmpty)

// MARK: Đếm số phần tử của mảng
//print(arrNumber1.count)


// MARK: Kiểm tra mảng có phần tử đó hay cưa
//print(arrNumber1.contains(9))
//print(arrNumber1.contains(1))

// MARK: Truy xuất vào phần tử của mảng
//print(arrNumber1[2])    // [index] >= 0 và < count


// MARK: Truy cập đến phần tử đầu hoặc cuối
//print(arrNumber1.first ?? "")
//print(arrNumber1.last ?? "")

// MARK: Duyệt mảng bằng vòng lặp
//for i in 0..<arrNumber1.count {
//    print(arrNumber1[i], terminator: ", ")
//}
//print()

// MARK: Thêm phần tử vào mảng
// C1: Dùng hảm append để thêm phần tử vào mảng
//repeatArr.append("Luu Huyen Trang")
//for i in 0..<repeatArr.count {
//    print(repeatArr[i])
//}
//print(repeatArr)

// C2:
//let arrName2 = ["Tu", "Tuan", "Viet"]
//repeatArr = repeatArr + arrName2
//print(repeatArr)

// C3:
//repeatArr.append(contentsOf: arrName2)
//print(repeatArr)

// MARK: Xoá phần tử trong mảng
//1
//repeatArr.remove(at: 2) // Xoá phần tử tại index 2

//2 Xoá nhanh phần tử đầu, cuối
//repeatArr.removeFirst()
//repeatArr.removeLast()

//3 Xoá tất cả các phần tử trong mảng
//repeatArr.removeAll()

//4
//repeatArr.removeAll {
//    name in name == "Nguyen Anh Tu"
//}
//print(repeatArr)

// MARK: Sửa giá trị phần tử trong mảng
//repeatArr[0] = "Luu Trang"
//print(repeatArr)

// MARK: insert: Chèn 1 phần tử vào mảng
//repeatArr.insert("Nguyen Anh Tu", at: 1)
//print(repeatArr)

// MARK: BT khởi tạo 1 mảng các số nguyên, in mảng ra màn hinh. Sau đó in ra các phần tử chẵn trong mảng

//var arrInt: [Int] = [5, 12, 9, -23, 8, -10, 68]
//print(arrInt)
//for i in 0..<arrInt.count { // ..<arrInt.count có thể thay bằng ...arrInt.count-1
//    if arrInt[i] % 2 == 0 {
//        print(arrInt[i])
//    }
//}

// MARK: Dictionary
//var dictionaryCapital: [String: String] = ["Vietnam": "Hanoi", "Thailand": "Bangkok", "China": "Backinh"]


// MARK: Truy xuât đến phần tử
//print("Thu do cua Vietnam là \(dictionaryCapital["Vietnam"] ?? "")")


// MARK: Duyệt dictionary
//print("Các phần tử trong mảng: ")
//for (key, value) in dictionaryCapital {
//    print(key, value)
//}

// MARK: Cập nhật các giá trị phần từ
//dictionaryCapital["China"] = "Bac Kinh"
//print(dictionaryCapital["China"] ?? "")

//dictionaryCapital.updateValue("Ha Noi", forKey: "Vietnam")
//print(dictionaryCapital["Vietnam"]  ?? "")

// MARK: Xoá phần tử
//dictionaryCapital.removeAll()   // Xoá tất cả các phần tử
//dictionaryCapital.removeValue(forKey: "China")  // Xoá phần tử có key là "China"
//print(dictionaryCapital)

//print("Các key đã lưu: ")
//for key in dictionaryCapital.keys {
//    print(key)
//}
//print("Các value đã lưu: ")
//for value in dictionaryCapital.values {
//    print(value)
//}

// MARK: BT tính số tiền điện, với số điện nhập tử bàn phím
/**
 Cáp điện từ 22kV đến dưới 110kV
 0...50: 1.555
 51...100: 1.611
 101...150: 1685
 151...200: 1.800
 >200: 2.000
 */

//print("Nhập số điện: ", terminator: "")
//var kWh = Int(readLine() ?? "") ?? 0

// C1
//if kWh < 0 {
//    print("Số điện không là số âm")
//} else if kWh >= 0 && kWh <= 50 {
//    print("Tiền điện là \(1555*kWh)")
//} else if kWh >= 51 && kWh <= 100 {
//    print("Tiền điện là \(1555*50 + 1611*(kWh-50))")
//} else if kWh >= 101 && kWh <= 150 {
//    print("Tiền điện là \((1555+1611)*50 + (kWh-100)*1685)")
//} else if kWh >= 151 && kWh <= 200 {
//    print("Tiền điện là \((1555+1611+1685)*50 + (kWh-150)*1800)")
//} else {
//    print("Tiền điện là \((1555+1611+1685+1800)*50 + (kWh-200)*2000)")
//}

// C2
//if kWh < 0 {
//    print("Số điện không là số âm")
//} else {
//    switch kWh {
//    case 0...50:
//        print("Tiền điện là \(1555*kWh)")
//    case 51...100:
//        print("Tiền điện là \(1555*50 + 1611*(kWh-50))")
//    case 101...150:
//        print("Tiền điện là \((1555+1611)*50 + (kWh-100)*1685)")
//    case 151...200:
//        print("Tiền điện là \((1555+1611+1685)*50 + (kWh-150)*1800)")
//    default:
//        print("Tiền điện là \((1555+1611+1685+1800)*50 + (kWh-200)*2000)")
//    }
//}

// MARK: Vòng lặp for
// C1:
//for i in 0...10 {
//    print(i)
//}

// C2:
//for item in repeatArr {
//    print(item)
//}

// C3:
//for item in repeatArr.enumerated() {
//    print(item.offset, item.element)
//}

// C4:
//for (index, value) in repeatArr.enumerated() {
//    print("Vị trí \(index) có giá trị \((value))")
//}

// C5:
//for _ in 1...10 {
//    print("ABC")
//}

// MARK: Ví dụ tính tổng của các số từ 1 đến 20
//var sum = 0
//for number in 1...20 {
//    sum += number   // sum = sum + number
//}
//print("Tổng của các số từ 1 đến 20 là \(sum)")

// MARK: Nhập vào 1 mảng sử dụng vòng lặp
//var danhsachTen: [String] = []
//print("Nhập số phần tử của mảng: ", terminator: "")
//let n = Int(readLine() ?? "") ?? 0
//for i in 0..<n {
//    print("Nhập phần tử thứ \(i+1): ")
//    let name = readLine() ?? ""
//    danhsachTen.append(name)
//}
//print(danhsachTen)

// MARK: Vòng lặp while
//var x = 1
//while x < 10 {
//    x+=1
//    print("Đang lặp")
//}
//print("Dừng lặp")

// MARK: Vòng lặp repeat...while...
//var y = 10
//repeat {
//    y-=1
//    print(y)
//} while y > 5

// MARK: Ví dụ nhập vào 1 số lớn hơn 0
//var numberTest: Int = 0
//repeat {
//    print("Mời nhập số lớn hơn 0: ")
//    numberTest = Int(readLine() ?? "") ?? 0
//} while numberTest <= 0
//            print("Nhập đúng")

// MARK: Câu lệnh điều kiện trong vòng lặp
// Contine: Bỏ qua các câu lệnh sau nó, thực hiện 1 vòng lặp mới
// Break: Thoát ra khỏi vòng lặp

//for i in 0...10 {
//    if i == 5 {
//        continue
//    } else if i == 8 {
//        break
//    }
//    print(i)
//}

// MARK: Hàm (function)
// Hàm không có tham số truyền vào, không có kiểu trả về
//func inRaManHinh() {
//    print("Hello there, i'm swift, i'm 8 years old")
//}
//inRaManHinh()

// Hàm có tham số truyền vào
//func inRaCanNang(can: Int) {
//    print("Cân nặng của bạn là \(can)")
//}
//inRaCanNang(can: 61)

// Hàm có kiểu trả về
//func tinhTong(a: Int, b: Int, c: Int) -> Int {
//    let sum = a + b + c  // return a + b + c
//    return sum
//}

// Hứng dữ liệu trả về
//var tong = tinhTong(a: 5, b: 10, c: 15)
//print("Tổng là: \(tong)")

// MARK: Tham số inout: Hàm có thể thay đổi giá trị của tham số truyền vào
//func doiCho(a: inout Int, b: inout Int) {
//    let tg = a
//    a = b
//    b = tg
//}
//var num1 = 10
//var num2 = 16
//print("Trước khi đổi: ")
//print("a là \(num1), b là \(num2)")
//doiCho(a: &num1, b: &num2)
//print("Sau khi đổi: ")
//print("a là \(num1), b là \(num2)")

// MARK: Viết chương trình nhập vào số a và b (Yêu cầu 0 < (a,b) < 1000)
// Người dùng nhập từ bàn phím từ 1->4
// 1. Viết hàm tính tổng 2 số rồi in ra màn hình
// 2. Viết hàm tính hiệu 2 số rồi in ra màn hình
// 3. Viết hàm tính tích 2 số rồi in ra màn hình
// 4. Viết hàm tính thương 2 số rồi in ra màn hình

//func tinhTong(a: Float, b: Float) -> Float {
//    return a + b    // print("a+b = \(a+b)")
//}

//func tinhHieu(a: Float, b: Float) -> Float {
//    return a - b    // Gọi return, hàm phải có kiểu dữ liệu (Float) trả về
//}

//func tinhTich(a: Float, b: Float) {
//    print("a*b = \(a*b)")    //return a * b
//}

//func tinhThuong(a: Float, b: Float) {
//    if b == 0 {
//        print("Không chia được cho số b")
//        return
//    }
//        print("a/b = \(a/b)")
//}

//func batTap() {

// Dùng while
//    var a: Float = -1
//    var b: Float = -1
//    while a < 0 || b < 0 || a > 1000 || b > 1000 {
//        print("Nhập vào số a: ", terminator: "")
//        a = Float(readLine() ?? "") ?? 0
//        print("Nhập vào số b: ", terminator: "")
//        b = Float(readLine() ?? "") ?? 0
//        print("Nhập vào phép tính: ", terminator: "")
//    }
    
// Dùng repeat ... while ...
//    var a: Float    // a = Float()
//    var b: Float    // b = Float()
//    repeat {
//        print("Nhập vào số a: ", terminator: "")
//        a = Float(readLine() ?? "") ?? 0
//        print("Nhập vào số b: ", terminator: "")
//        b = Float(readLine() ?? "") ?? 0
//    } while a < 0 || b < 0 || a > 1000 || b > 1000
//    print("Nhập vào phép tính: ", terminator: "")
//        let n = Int(readLine() ?? "") ?? 0
//        switch n {
//        case 1:
//            print("a + b = \(tinhTong(a: a, b: b))")
//        case 2:
//            print("a - b = \(tinhHieu(a: a, b: b))")
//        case 3:
//            tinhTich(a: a, b: b)
//        case 4:
//            tinhThuong(a: a, b: b)
//        default:
//            print("Vui lòng chọn phép tính từ 1 đến 4")
//        }
//}

//batTap()

// MARK: BT viết chương trình vẽ hình chữ nhật như sau, với chiều dài và chiều rộng nhập tử bàn phím (dài, rộng > 0)
//                          ************
//                          *==========*
//                          *==========*
//                          *==========*
//                          ************

func veHinhChuNhat() {
    var dai, rong: Int
    repeat {
        print("Nhập vào chiều dài và chiều rộng: ")
        dai = Int(readLine() ?? "") ?? 0
        rong = Int(readLine() ?? "") ?? 0
    } while dai < 0 || rong < 0
                for i in 0..<rong {
        if i == 0 || i == rong-1 {
            // Vẽ 2 dòng trên và dưới cùng
            for _ in 0..<dai {
                print("*", terminator: "")
            }
        } else {
            // Vẽ các dòng ở giữa
            for j in 0..<dai {
                if j == 0 || j == dai-1 {
                    // Nếu là 2 cột ngoài cùng
                    print("*", terminator: "")
                } else {
                    // Các cột còn lại
                    print("=", terminator: "")
                }
            }
        }
        print()
    }
}
veHinhChuNhat()
