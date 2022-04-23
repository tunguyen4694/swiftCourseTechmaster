//
//  ViewController.swift
//  Day5-UIView
//
//  Created by Nguyễn Anh Tú on 31/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    // Set ảnh cho UIImageView
    contentImageView.image = UIImage(named: "image")
    
    // Set ảnh cho UIImageView bằng ảnh defaut Xcode
    contentImageView.image = UIImage(systemName: "pencil")

    // Set ảnh từ Url
    guard let urlImage = URL(string: "https://cdn.pixabay.com/photo/2019/09/27/09/39/melons-4507974__480.jpg") else {
        return
    }
    
    do {
        let imageData = try Data(contentsOf: urlImage)
        contentImageView.image = UIImage(data: imageData)
    } catch {
        print("Error when get image: \(error.localizedDescription)")
    }
    
    // Content Mode
    contentImageView.contentMode = .scaleAspectFill
    
    // Alpha: Độ đậm của view (0 -> 1)
    contentImageView.alpha = 0.7
    
    // Hidden: Ẩn view (true/flase)
    contentImageView.isHidden = false
    
    // ClipToBounds: Hiển thị view đè ra ngoài khung
    contentImageView.clipsToBounds = true
    
    // CornerRadius: Bo góc
    contentImageView.layer.cornerRadius = 16
    
    // MARK: Progress
    // Hiển thị tiến độ Float 0.0 -> 1.0
    progressBar.progress = 0.9
    // Set màu của thanh bar đằng sau
    progressBar.trackTintColor = UIColor.brown
    // Set màu của thanh progress
    progressBar.progressTintColor = UIColor.green
    
    // MARK: Activity Indicator
    // Kiểm tra activityIndicator đang chạy hay không
    print(activityIndicator.isAnimating)
    // Cho activityIndicator chạy hoạt ảnh
    activityIndicator.startAnimating()
    // Dừng hoạt ảnh
//    activityIndicator.stopAnimating()
    // Ẩn Indicator khi đã dừng hoạt ảnh
    activityIndicator.hidesWhenStopped = false
    // Set màu Indicator
    activityIndicator.color = .red // Màu của vòng loading
    activityIndicator.backgroundColor = .clear
        
//        setUpTimer()
        setProgress()
        
    }

func setProgress() {
    progressBar.progress = 0
    timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {
        _ in self.progressBar.progress += 0.01 // Mỗi 0.01 giây tăng progress lên 0.01
        if self.progressBar.progress >= 1 { // Nếu progress >= 1 thì dừng timer, set timer mới
            self.timer?.invalidate()
            // Cho progressBar chạy ngược lại
            self.timer? = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in self.progressBar.progress -= 0.01 // Mỗi 0.01 giây trừ progress đi 0.01
            if self.progressBar.progress <= 0 { // Nếu progress <= 0
                self.timer?.invalidate() // Dừng timer
//                self.setProgress()
                // Xoá view progressBar ra khỏi SuperView
                self.progressBar.removeFromSuperview()
                    }
                })
            }
        })
    }

func setUpTimer() {
    // timeInterval: là thời gian để lập lại khối lệnh trong Timer
    // repeats: true/false => có lặp lại khối lệnh hay không
    // block: khối lệnh để timer thực hiện lặp lại
    var i: Float = 0.0
    timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { _ in i += 0.5
        
        print(i)
        
        // Kiểm tra timer có đang còn chạy
        print(self.timer?.isValid)
        
        if i >= 50 {
            // Cho dừng timer
            self.timer?.invalidate()
            print(self.timer?.isValid)
            }
        })
    }
}
