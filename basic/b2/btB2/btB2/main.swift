//
//  main.swift
//  btB2
//
//  Created by Nguyễn Anh Tú on 06/04/2022.
//

import Foundation

//print("Hello, World!")

// BT1: Viết chương trình nhập vào 1 dãy số nguyên, in ra số lớn nhất và số nhỏ nhất của dãy.

// C1:
var arrNum = [1, 2, 3, -1, -5, 9, 8, 7, 6]
var min = arrNum[0]
var max = arrNum[0]

for i in 0..<arrNum.count {
    if min > arrNum[i] {
        min = arrNum[i]
    }
    if  max < arrNum[i] {
        max = arrNum[i]
    }
}

print("Số lớn nhất: \(max)")
print("Số nhỏ nhất: \(min)")

// C2:
print("Số lớn nhất là: \(arrNum.max() ?? 0)")
print("Số nhỏ nhất là: \(arrNum.min() ?? 0)")

// C3:
let minMax = arrNum.sorted()
print(minMax)
print("Số lớn nhất: \(minMax[minMax.count-1])")
print("Số nhỏ nhất: \(minMax[0])")

// BT2: Nhập vào một số có 5 chữ số, tính tổng của 5 chữ số đó.


// C1:
//var soNguyen: Int = 0
//
//while (soNguyen < 10000 || soNguyen > 99999) && (soNguyen > -10000 || soNguyen < -99999) {
//    print("Nhập số có 5 chữ số: ", terminator: "")
//    soNguyen = Int(readLine() ?? "") ?? 0
//}
//
//print("Tổng của 5 chữ số đó là \(soNguyen/10000 + soNguyen%10000/1000 + soNguyen%10000%1000/100 + soNguyen%10000%1000%100/10 + soNguyen%10000%1000%100%10)")

// C2:
//var soNguyen: Int
//repeat {
//    print("Nhập số có 5 chữ số: ",terminator: "")
//    soNguyen = Int(readLine() ?? "") ?? 0
//} while (soNguyen < 10000 || soNguyen > 99999) && (soNguyen > -10000 || soNguyen < -99999)
//
//print("Tổng của 5 chữ số đó là \(soNguyen/10000 + soNguyen%10000/1000 + soNguyen%10000%1000/100 + soNguyen%10000%1000%100/10 + soNguyen%10000%1000%100%10)")


// BT3: Viết chương trình tính tổng của dãy số gồm n số: 1, 3, 5, 7, 9, …n. Với n là số lẻ nhập từ bàn phím.

//var sum = 0
//var soLe = 1
//var n: Int
//repeat {
//    print("Nhập n: ", terminator: "")
//    n = Int(readLine() ?? "") ?? 0
//} while n%2 == 0

//for i in 0...n {

// C1:
//    if i % 2 == 0 {
//        continue
//    } else {
//        sum = sum + soLe
//        soLe = soLe + 2
//    }

// C2:
//    if i % 2 != 0 {
//        sum = sum + soLe
//        soLe = soLe + 2
//    }
//}
//print(sum)

// BT4: Vẽ hình tam giác vuông có chiều cao nhập từ bàn phím:
/**
 
 a.
 *
 **
 
 b.
 *
 **
 ***
 
 */

func veTamGiacVuong() {
    var nhap: Int
    repeat {
    print("Nhập chiều cao tam giác vuông cân: ", terminator: "")
    nhap = Int(readLine() ?? "") ?? 0
    } while nhap < 0
                
//    for i in 1...nhap {
//        for _ in 1...i {
//            print("*", terminator: "")
//        }
//    print("")
//    }
    
    // Tam giác vuông ngược cạnh huyền về phía bên trái
//    for i in 1...nhap {
//        for _ in 1...i {
//            print(" ", terminator: "")
//        }
//        for _ in i...nhap {
//            print("*", terminator: "")
//        }
//        print("")
//    }
    
    // Tam giác vuông ngược với BT
//    for i in stride(from: nhap, through: 1, by: -1) {
//        for _ in 1...i {
//            print("*", terminator: "")
//        }
//        print("")
//    }
    
    // Tam giác vuông ngược với BT
//    for i in (1...nhap).reversed() {
//        for _ in 1...i {
//            print("*", terminator: "")
//        }
//        print("")
//    }
    
    // Tam giác vuông cạnh huyền về phía bên trái
    for i in (0..<nhap).reversed() {
        for _ in (0..<i).reversed() {
            print(" ", terminator: "")
        }
        for _ in (i..<nhap).reversed() {
            print("*", terminator: "")
        }
        print("")
    }
    
}

//veTamGiacVuong()
