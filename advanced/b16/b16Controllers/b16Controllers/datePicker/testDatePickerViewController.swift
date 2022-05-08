//
//  testDatePickerViewController.swift
//  b16Controllers
//
//  Created by Nguyễn Anh Tú on 05/05/2022.
//

import UIKit

class testDatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.datePickerMode = .dateAndTime
        datePicker.setDate(getTomorrow(), animated: false)

    }

    func getTomorrow() -> Date {
    // Get right now as it's `DateComponents`.
    let now = Calendar.current.dateComponents(in: .current, from: Date())

    // Create the start of the day in `DateComponents` by leaving off the time.
    let today = DateComponents(year: now.year, month: now.month, day: now.day)
    let dateToday = Calendar.current.date(from: today)!
    print(dateToday.timeIntervalSince1970)

    // Add 1 to the day to get tomorrow.
    // Don't worry about month and year wraps, the API handles that.
    let tomorrow = DateComponents(year: now.year, month: now.month, day: now.day! + 1)
    let dateTomorrow = Calendar.current.date(from: tomorrow)!
        return dateTomorrow
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
