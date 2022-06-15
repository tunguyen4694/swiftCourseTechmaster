//
//  CreateTodoViewControllerViewController.swift
//  b21ToDoList
//
//  Created by Nguyễn Anh Tú on 22/05/2022.
//

import UIKit
import Photos

class CreateTodoViewControllerViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    // Pass data closure
    // B1: Tạo biến closure
    var passData: ((_ todo: Todo?) -> Void)?
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.placeholder = "Enter title here ..."
        titleTextField.layer.cornerRadius = 4
        titleTextField.layer.borderWidth = 0.5
        titleTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        contentTextView.layer.cornerRadius = 4
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.layer.borderWidth = 0.5
        contentTextView.text = "Enter content here ..."
        contentTextView.textColor = .lightGray
        contentTextView.contentInset = .init(top: 2, left: 2, bottom: 2, right: 2)
        contentTextView.delegate = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        if let todo = todo {
            titleTextField.text = todo.title
            contentTextView.text = todo.content
            photoImageView.image = todo.image
            
            if !todo.content.isEmpty {
                contentTextView.textColor = UIColor.black
            }
        }
    }
    
    @IBAction func onChooseFile(_ sender: Any) {
        let alertController = UIAlertController(title: "Todo App", message: "Choose image from", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            self.onChooseCamera()
        }
        let libraryAction = UIAlertAction(title: "Library", style: .default) { _ in
            self.onChooseLibrary()
        }
        alertController.addAction(cameraAction)
        alertController.addAction(libraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func setting() {
        let message = "App needs access to your photos library"
        let alertController = UIAlertController(title: "Todo App", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let settingUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingUrl) {
                if #available(iOS 10.0, *) {
                } else {
                    UIApplication.shared.openURL(settingUrl)
                }
            }
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func onChooseLibrary() {
        func choosePhote() {
            DispatchQueue.main.async {
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                self.imagePicker.modalPresentationStyle = .popover
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        // Khai báo biến để lấy quyền truy cập
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == PHAuthorizationStatus.authorized) { // Quyền truy cập đã được cấp
            choosePhote()
        } else if (status == PHAuthorizationStatus.denied) { // Quyền truy cập bị từ chối
            setting()
        } else if (status == PHAuthorizationStatus.notDetermined) { // Quyền truy cập chưa được xác nhận
            PHPhotoLibrary.requestAuthorization() { (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                choosePhote()
            } else {
                self.setting()
            }
        }
        } else if (status == PHAuthorizationStatus.restricted) { // Quyền truy cập bị hạn chế
            setting()
        } else if (status == PHAuthorizationStatus.limited) {
            
        } else {
            setting()
        }
    }
    
    func onChooseCamera() {
        
    }
    
    @IBAction func onSaveTodo(_ sender: Any) {
        guard let title = titleTextField.text, let content = contentTextView.text else {
            return
        }
        
        let todo = Todo(title: title, content: content, image: photoImageView.image)
        // B2: Khởi tạo closure
        passData?(todo)
        
        navigationController?.popViewController(animated: true)
        
    }

}

extension CreateTodoViewControllerViewController: UITextViewDelegate {
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
        }
    }
}

extension CreateTodoViewControllerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Error select image: \(info)")
            return
        }
        self.photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}
