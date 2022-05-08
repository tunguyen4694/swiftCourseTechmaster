//
//  testPickerViewViewController.swift
//  b16Controllers
//
//  Created by Nguyễn Anh Tú on 05/05/2022.
//

import UIKit

class testPickerViewViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var printDayLabel: UILabel!
    
    
    let weekDays = ["Monday", "Tuesday",  "Wenesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configPickerView()
    }
    
    func configPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
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

extension testPickerViewViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekDays.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}

extension testPickerViewViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekDays[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.printDayLabel.text = weekDays[row]
    }
}
