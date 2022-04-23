//
//  main.swift
//  btB4
//
//  Created by Nguyễn Anh Tú on 13/04/2022.
//

import Foundation

//print("Hello, World!")

// Viết chương trình quẩn lý công nhân của 1 công ty bao gồm các thông tin: Tên công ty, tên giám đốc, hotline liên hệ, địa chỉ, danh sách công nhân.
/**
 Mỗi công nhân có các thông tin: Tên, số điện thoại, tuổi, Quê quán
 1. Thêm 1 công nhân vào danh sách
 2. In ra thông tin của 1 công nhân tìm theo tên
 3. Xoá 1 công nhân theo tên
 4. Sửa thông tin công nhân theo tên
 5. Sắp xếp danh sách công nhân theo số tuổi tăng dần
 */

struct Worker {
    init(nameWorker: String? = nil, telWorker: Int? = nil, ageWorker: Int? = nil, hometownWorker: String? = nil) {
        self.nameWorker = nameWorker
        self.telWorker = telWorker
        self.ageWorker = ageWorker
        self.hometownWorker = hometownWorker
    }

    var nameWorker: String?
    var telWorker: Int?
    var ageWorker: Int?
    var hometownWorker: String?

}

struct company {
    init(nameCompany: String? = nil, nameDirector: String? = nil, hotline: Int? = nil, addCompany: String, workers: [Worker]) {
        self.nameCompany = nameCompany
        self.nameDirector = nameDirector
        self.hotline = hotline
        self.addCompany = addCompany
        self.workers = workers
    }

    var nameCompany: String?
    var nameDirector: String?
    var hotline: Int?
    var addCompany: String?
    var workers: [Worker]?

    mutating func addWorker() {
        print("Nhập tên công nhân cần thêm:", terminator: " ")
        let nameWorker = readLine() ?? ""
        print("Nhập SĐT công nhân cần thêm:", terminator: " ")
        let telWorker = Int(readLine() ?? "") ?? 0
        print("Nhập tuổi công nhân cần thêm:", terminator: " ")
        let ageWorker = Int(readLine() ?? "") ?? 0
        print("Nhập quê quán công nhân cần thêm:", terminator: " ")
        let hometownWorker = readLine() ?? ""

        let worked = Worker(nameWorker: nameWorker, telWorker: telWorker, ageWorker: ageWorker, hometownWorker: hometownWorker)

        workers?.append(worked)
    }

    func findWorker() {
        print("Nhập tên công nhân cần tìm thông tin: ", terminator: " ")
        let nameWorker = readLine() ?? ""
        for i in 0..<(workers?.count ?? 0) {
            if workers?[i].nameWorker == nameWorker {
                print("Thông tin công nhân cần tìm:")
                print(workers?[i] ?? 0)
            }
        }
    }

    mutating func delWorker() {
        print("Nhập tên công nhân cần xoá")
        let nameWorker = readLine() ?? ""
        for i in 0..<(workers?.count ?? 0) {
            if workers?[i].nameWorker == nameWorker {
                workers?.remove(at: i)
                break
            }
        }
        print("Đã xoá công nhân thành công!")
    }

    mutating func updateWorker() {
        print("Nhập tên công nhân cần sửa thông tin: ")
        let nameWorker = readLine() ?? ""
        for i in 0..<(workers?.count ?? 0) {
            if workers?[i].nameWorker == nameWorker {
                print("Nhập tên cần sửa: ")
                let nameWorkerFix = readLine() ?? ""
                print("Nhập SĐT cần sửa: ")
                let telWorker = Int(readLine() ?? "") ?? 0
                print("Nhập tuổi cần sửa: ")
                let ageWorker = Int(readLine() ?? "") ?? 0
                print("Nhập quê quán cần sửa: ")
                let hometownWorker = readLine() ?? ""
                workers?[i].nameWorker = nameWorkerFix
                workers?[i].telWorker = telWorker
                workers?[i].ageWorker = ageWorker
                workers?[i].hometownWorker = hometownWorker
                print("Đã sửa thông tin thành công!")
                print("Thông tin sau khi sửa là: \(String(describing: workers?[i]))")
            }
        }
    }

    func sortWorker() {
        let sortWokers = workers?.sorted(by: {
            worker1, worker2 in worker1.ageWorker ?? 0 < worker2.ageWorker ?? 0
        })
        print("Danh sách công nhân sau khi sắp xếp: ")
        print(sortWokers as Any)
    }

    func printWorkers() {
        print(workers ?? [])
    }

}

print("Nhập tên công ty: ", terminator: " ")
let nameCompany = readLine() ?? ""
print("Nhập tên giám đốc: ",terminator: " ")
let nameDirector = readLine() ?? ""
print("Nhập hotline công ty: ", terminator: " ")
let hotline = Int(readLine() ?? "") ?? 0
print("Nhập địa chỉ công ty: ", terminator: " ")
let addCompany = readLine() ?? ""

var com = company(nameCompany: nameCompany, nameDirector: nameDirector, hotline: hotline, addCompany: addCompany, workers: [])

print("Nhập số lượng công nhân: ", terminator: " ")
let numberWorker = Int(readLine() ?? "") ?? 0

for _ in 0..<numberWorker {
    com.addWorker()
}

print("Chương trình quản lý công nhân")
print("Chọn chức năng")
print("1 - Thêm 1 công nhân vào danh sách")
print("2 - In ra thông tin 1 công nhân tìm theo tên")
print("3 - Xoá 1 công nhân theo tên")
print("4 - Sửa thông tin công nhân theo tên")
print("5 - Sắp xếp danh sách công nhân theo số tuổi tăng dần")

var choose: Int = 0
while (choose < 1 || choose > 5) {
    print("Chọn chức năng")
    choose = Int(readLine() ?? "") ?? 0
}

switch choose {
    case 1:
    com.addWorker()
    print("Đã thêm công nhân thành công!")
    print("DS công nhân sau khi thêm là: \(com.printWorkers())")
    case 2:
        com.findWorker()
    case 3:
        com.delWorker()
    print("DS công nhân sau khi xoá là:")
    com.printWorkers()
    case 4:
        com.updateWorker()
    case 5:
        com.sortWorker()
default:
    print("Vui lòng chọn chức năng từ 1 đến 5")
}

//com.printWorkers()
//com.findWorker()
//com.delWorker()
//com.printWorkers()
//com.updateWorker()
//com.printWorkers()
//com.sortWorker()


