//
//  main.swift
//  btB1
//
//  Created by Nguyễn Anh Tú on 04/04/2022.
//

import Foundation

//print("Hello, World!")

// Bài 1: Viết chương trình nhập vào 2 số là 2 cạnh của hình chữ nhật. In ra màn hình chu vi và diện tích của hình chữ nhật
//print("Nhập vào 2 cạnh HCN: ")
//print("Cạnh a: ", terminator: "")
//var a = Float(readLine() ?? "") ?? 0
//print("Cạnh b: ", terminator: "")
//var b = Float(readLine() ?? "") ?? 0
//
//if a > 0 && b > 0 {
//    print("Chu vi HCN là: \(2*(a+b))")
//    print("Diện tích hình chữ nhật là: \(a*b)")
//} else {
//    print("Nhập lại a, b > 0")
//}

// Bài 2: Viết chương trình giả phương trình bậc nhất ax + b = 0, với a, b là 2 hệ số nhập từ bàn phím
//print("Có phương trình ax + b = 0")
//print("Nhập số a:", terminator: " ")
//var a = Float(readLine() ?? "") ?? 0
//print("Nhập số b:", terminator: " ")
//var b = Float(readLine() ?? "") ?? 0
//
//if a == 0 && b == 0 {
//    print("PT có vô số nghiệm")
//} else if a == 0 && b != 0 {
//    print("PT vô ngiệm")
//} else {
//    print("PT có nghiệm là x = \(-b/a)")
//}

// Bài 3: Nhập vào 3 điềm môn Toán, Lý, Hoá. Tính điểm trung bình cộng biết điểm Toán hệ số 3, Lý hệ số 2 và Hoá hệ số 1
//print("Nhập vào điểm môn Toán: ", terminator: "")
//var dToan = Float(readLine() ?? "") ?? 0
//print("Nhập vào điểm môn Lý: ", terminator: "")
//var dLy = Float(readLine() ?? "") ?? 0
//print("Nhập vào điểm môn Hoá: ", terminator: "")
//var dHoa = Float(readLine() ?? "") ?? 0
//
//print("Điểm TB cộng là \((dToan*3 + dLy*2 + dHoa)/6)")

// Bài 4: Chuyển đổi độ C sang độ F với công thức C = 5*(F-32)/9
//print("Nhập vào độ C: ", terminator: "")
//var doC = Float(readLine() ?? "") ?? 0
//print("Độ F là \(9*doC/5+32)")

// Bài 5: Viết chương trình nhập vào số nguyên 3 chữ số (từ 100 - 999), sau đó in ra các chữ số thuộc hàng trăm hàng chục, hàng đơn vị. (Chú ý dùng toán tử chia lấy nguyên và chia lấy dư)
//var soNguyen: Int = 0
//
//while (soNguyen < 100 || soNguyen > 999) {
//    print("Nhập vào số nguyên: ")
//    soNguyen = Int(readLine() ?? "") ?? 0
//}
//print("Chữ số hàng trăm là \(soNguyen/100)")
//print("Chữ số hàng chục là \(soNguyen%100/10)")
//print("Chữ số hàng đơn vị là \(soNguyen%100%10)")
