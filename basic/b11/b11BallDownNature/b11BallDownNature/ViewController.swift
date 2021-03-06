//
//  ViewController.swift
//  b11BallDownNature
//
//  Created by Nguyễn Anh Tú on 16/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let ballView = UIView()
    var timer: Timer!
    
    // Các thông số vận tốc, gia tốc, thời gian
    let a: CGFloat = 10.0
    var v: CGFloat = 0.0
    var t: CGFloat = 0.01
    // Độ cao tối đa
    var h: CGFloat = 0.0
    // Kiểm tra bóng đi lên hay xuống
    var checkIsDown: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Làm UI cho quả bóng rơi tự do sử dụng Timer
        // v = a * t
        // v là vận tốc, a là gia tốc = 10, t là thời gian
        // h là độ cao tối đa khi quả bóng bay lên
        
        view.addSubview(ballView)
        ballView.frame = .init(x: 0, y: 0, width: 100, height: 100)
        ballView.center = view.center
        ballView.backgroundColor = .systemOrange
        ballView.layer.cornerRadius = 50
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.runTimer()
        })
        
    }
    @objc func runTimer() {
        // Kiểm tra xem bóng đang rơi xuống hay đi lên
        if checkIsDown {
            // Nếu rơi xuống => vận tốc tăng dần
            v += a * t
            // Cộng thêm quãng đường đi được là v * t
            self.ballView.frame.origin.y += v * t * 300
            // Kiểm tra nếu bóng đã chạm đấy
            if self.ballView.frame.maxY >= self.view.bounds.maxY {
                // Đổi hướng thành đi lên
                checkIsDown = !checkIsDown
                // Nếu bóng đã dừng lại, thì huỷ timer
                if h >= self.view.frame.maxY {
                    timer.invalidate()
                }
            }
        } else {
            // Nếu bóng đi lên => vận tốc giảm dần
            v -= a * t
            // Thay đổi độ cao của quả bóng theo thời gian t
            self.ballView.frame.origin.y -= v * t * 300
            // v giảm dần, nếu v = 0 => bóng dừng lại và rơi xuống
            if self.v <= 0 {
                v = 0
                // Đổi hương thành rơi xuống
                checkIsDown = !checkIsDown
                // Gán độ cao cực đại mới
                h = self.ballView.frame.maxY
            }
        }
    }


}

