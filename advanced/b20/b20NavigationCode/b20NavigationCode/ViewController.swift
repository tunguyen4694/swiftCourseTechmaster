//
//  ViewController.swift
//  b20NavigationCode
//
//  Created by Nguyễn Anh Tú on 18/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var isHasDescription: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bookTextField.placeholder = "Enter name book here ..."
        bookTextField.layer.cornerRadius = 4
        bookTextField.layer.borderWidth = 1
        bookTextField.layer.borderColor = UIColor.orange.cgColor
        
        descriptionTextView.text = "Enter description book here ..."
        descriptionTextView.textColor = .lightGray
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.orange.cgColor
        descriptionTextView.contentInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        descriptionTextView.layer.cornerRadius = 4
        
        addButton.setTitle("ADD +", for: .normal)
        addButton.setTitleColor(.orange, for: .normal)

        descriptionTextView.delegate = self
        
    }

    @IBAction func onPressAdd(_ sender: Any) {
        guard let nameBook = bookTextField.text else {
            return
        }
        
        guard let description = descriptionTextView.text else {
            return
        }
        
        if !isHasDescription {
            return
        }
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        vc.newBook = Book(name: nameBook, description: description)
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true, completion: nil)

    }
    
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter descipton book here ..."
            textView.textColor = .lightGray
            isHasDescription = false
        } else {
            isHasDescription = true
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text.isEmpty {
            isHasDescription = false
        } else {
            isHasDescription = true
        }
        return true
    }
    
}
