//
//  ViewController.swift
//  btB8
//
//  Created by Nguyễn Anh Tú on 12/04/2022.
//

import UIKit

class ViewController: UIViewController {

    let containerView: UIView = UIView()
    
    var timer1: Timer!
    var timer2: Timer!
    var timer3: Timer!
    var timer4: Timer!
    var timer5: Timer!
    var timer6: Timer!
    var timer7: Timer!
    var timer8: Timer!
    var timer9: Timer!
    var timer10: Timer!
    var timer11: Timer!
    var timer12: Timer!
    var timer13: Timer!
    var timer14: Timer!
    var timer15: Timer!
    var timer16: Timer!
    var timer17: Timer!
    var timer18: Timer!
    var timer19: Timer!
    var timer20: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(containerView)
        containerView.frame = .init(x: 0, y: 0, width: 100, height: 100)
//        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 50
        containerView.backgroundColor = .systemRed
        
        step1()

    }

    func step1() {
        timer1 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x += 0.1
            if self.containerView.frame.maxX >= self.view.frame.maxX {
                self.timer1.invalidate()
                self.step2()
            }
        })
    }
    
    func step2() {
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y += 0.1
            if self.containerView.frame.minY >= (self.view.frame.maxY-100)/5 {
                self.timer2.invalidate()
                self.step3()
            }
        })
    }
    
    func step3() {
        timer3 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x -= 0.1
            if self.containerView.frame.minX <= self.view.frame.minX {
                self.timer3.invalidate()
                self.step4()
            }
        })
    }

    func step4() {
        timer4 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y += 0.1
            if self.containerView.frame.minY >= (self.view.frame.maxY-100)*2/5 {
                self.timer4.invalidate()
                self.step5()
            }
        })
    }
    
    func step5() {
        timer5 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x += 0.1
            if self.containerView.frame.maxX >= self.view.frame.maxX {
                self.timer5.invalidate()
                self.step6()
            }
        })
    }
    
    func step6() {
        timer6 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y += 0.1
            if self.containerView.frame.minY >= (self.view.frame.maxY-100)*3/5 {
                self.timer6.invalidate()
                self.step7()
            }
        })
    }
    
    func step7() {
        timer7 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x -= 0.1
            if self.containerView.frame.minX <= self.view.frame.minX {
                self.timer7.invalidate()
                self.step8()
            }
        })
    }
    
    func step8() {
        timer8 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y += 0.1
            if self.containerView.frame.minY >= (self.view.frame.maxY-100)*4/5 {
                self.timer8.invalidate()
                self.step9()
            }
        })
    }
    
    func step9() {
        timer9 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x += 0.1
            if self.containerView.frame.maxX >= self.view.frame.maxX {
                self.timer9.invalidate()
                self.step10()
            }
        })
    }
    
    func step10() {
        timer10 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y += 0.1
            if self.containerView.frame.minY >= self.view.frame.maxY-100 {
                self.timer10.invalidate()
                self.step11()
            }
        })
    }
    
    func step11() {
        timer11 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x -= 0.1
            if self.containerView.frame.minX <= self.view.frame.minX {
                self.timer11.invalidate()
                self.step12()
            }
        })
    }
    
    func step12() {
        timer12 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y -= 0.1
            if self.containerView.frame.maxY <= (self.view.frame.maxY)*4/5 {
                self.timer12.invalidate()
                self.step13()
            }
        })
    }
    
    func step13() {
        timer13 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x += 0.1
            if self.containerView.frame.maxX >= self.view.frame.maxX {
                self.timer13.invalidate()
                self.step14()
            }
        })
    }
    
    func step14() {
        timer14 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y -= 0.1
            if self.containerView.frame.maxY <= (self.view.frame.maxY)*3/5 {
                self.timer14.invalidate()
                self.step15()
            }
        })
    }
    
    func step15() {
        timer15 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x -= 0.1
            if self.containerView.frame.minX <= self.view.frame.minX {
                self.timer15.invalidate()
                self.step16()
            }
        })
    }
    
    func step16() {
        timer16 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y -= 0.1
            if self.containerView.frame.maxY <= (self.view.frame.maxY)*2/5 {
                self.timer16.invalidate()
                self.step17()
            }
        })
    }
    
    func step17() {
        timer17 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x += 0.1
            if self.containerView.frame.maxX >= self.view.frame.maxX {
                self.timer17.invalidate()
                self.step18()
            }
        })
    }
    
    func step18() {
        timer18 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y -= 0.1
            if self.containerView.frame.maxY <= (self.view.frame.maxY)/5 {
                self.timer18.invalidate()
                self.step19()
            }
        })
    }
    
    func step19() {
        timer19 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in
            self.containerView.frame.origin.x -= 0.1
            if self.containerView.frame.minX <= self.view.frame.minX {
                self.timer19.invalidate()
                self.step20()
            }
        })
    }
    
    func step20() {
        timer20 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _
            in
            self.containerView.frame.origin.y -= 0.1
            if self.containerView.frame.minY <= self.view.frame.minY {
                self.timer20.invalidate()
                self.step1()
            }
        })
    }
    
}

