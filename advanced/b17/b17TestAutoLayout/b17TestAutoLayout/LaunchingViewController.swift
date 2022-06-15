//
//  LaunchingViewController.swift
//  b17TestAutoLayout
//
//  Created by Nguyễn Anh Tú on 10/05/2022.
//

import UIKit

class LaunchingViewController: UIViewController {

    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo_home")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let covidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "COVID - 19"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.mainColor()
        label.textAlignment = .center
        return label
    }()
    
    let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text booking app"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.mainColor()
        label.textAlignment = .center
        return label
    }()
    
    let demoTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "demo input ..."
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.mainColor().cgColor
        
        let eyeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        eyeImageView.image = UIImage.init(systemName: "eye.fill")?.withRenderingMode(.alwaysTemplate)
        eyeImageView.tintColor = UIColor.mainColor()
        
        textField.rightView = eyeImageView
        textField.rightViewMode = .always
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.backgroundColor()
        configLayouts()
        
    }
    
    
    func configLayouts() {
        
        // MARK: addSubView

        self.view.addSubview(photoImageView)
        self.view.addSubview(covidLabel)
        self.view.addSubview(testLabel)
        
        // MARK: Layout

        photoImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor, multiplier: 1).isActive = true
        photoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
        
        covidLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor, constant: 0).isActive = true
        covidLabel.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 10).isActive = true
        covidLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        
        testLabel.topAnchor.constraint(equalTo: covidLabel.bottomAnchor, constant: 20).isActive = true
        testLabel.widthAnchor.constraint(equalTo: covidLabel.widthAnchor, multiplier: 1).isActive = true
        testLabel.centerXAnchor.constraint(equalTo: covidLabel.centerXAnchor, constant: 1).isActive = true
    }
    
}
