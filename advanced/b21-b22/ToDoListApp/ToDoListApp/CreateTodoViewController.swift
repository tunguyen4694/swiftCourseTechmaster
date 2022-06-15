//
//  CreateTodoViewController.swift
//  ToDoListApp
//
//  Created by Nguyễn Anh Tú on 04/06/2022.
//

import UIKit
import Photos

class CreateTodoViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    var todo: Todo?
    var passData: ((_ todo: Todo?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.placeholder = "Enter title here ..."
        titleTextField.layer.cornerRadius = 4
        titleTextField.layer.borderWidth = 0.5
        titleTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        contentTextView.layer.cornerRadius = 4
        contentTextView.layer.borderWidth = 0.5
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.text = "Enter content here ..."
        contentTextView.textColor = .lightGray
        contentTextView.contentInset = .init(top: 2, left: 2, bottom: 2, right: 2)
        contentTextView.delegate = self
        
        photoImageView.layer.cornerRadius = 4
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTodo))
        
        navigationItem.rightBarButtonItem = saveButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let todo = todo {
            titleTextField.text = todo.title
            contentTextView.text = todo.content
            photoImageView.image = todo.image
            
            if !todo.content.isEmpty {
                contentTextView.textColor = .black
            }
        }
    }
    
    @objc func saveTodo() {
        guard let title = titleTextField.text, let content = contentTextView.text else { return }
        
        let todo = Todo(title: title, content: content, image: photoImageView.image)
        passData?(todo)
        
        navigationController?.popViewController(animated: true)
    }

    @IBAction func chooseImage(_ sender: Any) {
        let alertController = UIAlertController(title: "Todo List App", message: "Choose image from", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseCamera()
        }
        let libraryAction = UIAlertAction(title: "Library", style: .default) { _ in
            self.chooseLibrary()
        }
        alertController.addAction(cameraAction)
        alertController.addAction(libraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func setting() {
        let massage = "App needs access to your photos library"
        let alertController = UIAlertController(title: "Todo List App", message: massage, preferredStyle: .alert)
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
        present(alertController, animated: true, completion: nil)
    }
    
    func chooseCamera() {
        
    }
    
    func chooseLibrary() {
        func choosePhoto() {
            DispatchQueue.main.async {
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                self.imagePicker.modalPresentationStyle = .automatic
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == PHAuthorizationStatus.authorized) {
            choosePhoto()
        } else if (status == PHAuthorizationStatus.denied) {
            setting()
        } else if (status == PHAuthorizationStatus.notDetermined) {
            PHPhotoLibrary.requestAuthorization { (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                    choosePhoto()
                } else {
                    self.setting()
                }
            }
        } else if (status == PHAuthorizationStatus.restricted) {
            setting()
        } else if (status == PHAuthorizationStatus.limited) {
            
        } else {
            setting()
        }
    }
    
}

extension CreateTodoViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter content here ..."
            textView.textColor = .lightGray
        }
    }
}

extension CreateTodoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Error select image: \(info)")
            return
        }
        self.photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}
