//
//  RegisterViewController.swift
//  b17TestAutoLayout
//
//  Created by Nguyễn Anh Tú on 12/05/2022.
//

import UIKit

class RegisterViewCotroller: UIViewController {
    
    let registerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "REGISTER"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.setTextSpacingBy(value: 3)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let mobileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mobile Number"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let mobileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.mainColor().cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    
    let mobileTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.mainColor()
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let aadhaarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Aadhaar Number"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let aadhaarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.mainColor().cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    
    let aadhaarTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.mainColor()
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let newPassLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New Password"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let newPassView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.mainColor().cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    
    let newPassTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.mainColor()
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let confirmPassLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirm Password"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let confirmPassView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.mainColor().cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    
    let confirmPassTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.mainColor()
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let registerDoneView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mainColor()
        view.layer.cornerRadius = 10
        return view
    }()
    
    let registerDoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Register"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let registerDoneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let termsPolicesTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "By registering, you automatically accept the Terms & Policies of COVID - 19 app."
//        textView.textAlignment = .center
//        textView.font = UIFont.systemFont(ofSize: 12)
//        textView.textColor = .mainColor()
        textView.backgroundColor = .clear
        
        let hyperText = "Terms & Policies"
        let formatText = String.format(strings: [hyperText], boldFont: .boldSystemFont(ofSize: 12), boldColor: .mainColor(), inString: textView.text, font: .systemFont(ofSize: 12), color: .mainColor())
        
        textView.attributedText = formatText
        textView.textAlignment = .center

        return textView
    }()
    
    let loginLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.mainColor()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "New User? Register Here", attributes: underlineAttribute)
                label.attributedText = underlineAttributedString
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor()
        
        configLayout()
        
    }
    
    
    func configLayout() {
        view.addSubview(containerView)
        view.addSubview(registerTitleLabel)
        
        registerTitleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        registerTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        
        containerView.addSubview(mobileLabel)
        containerView.addSubview(mobileView)
        mobileView.addSubview(mobileTextField)
        
        containerView.addSubview(aadhaarLabel)
        containerView.addSubview(aadhaarView)
        aadhaarView.addSubview(aadhaarTextField)
        
        containerView.addSubview(newPassLabel)
        containerView.addSubview(newPassView)
        newPassView.addSubview(newPassTextField)
        
        containerView.addSubview(confirmPassLabel)
        containerView.addSubview(confirmPassView)
        confirmPassView.addSubview(confirmPassTextField)
        
        containerView.addSubview(registerDoneView)
        registerDoneView.addSubview(registerDoneLabel)
        registerDoneView.addSubview(registerDoneButton)
        
        containerView.addSubview(termsPolicesTextView)
        
        containerView.addSubview(loginLabel)
        containerView.addSubview(loginButton)
        
        mobileLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        mobileLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        
        mobileView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        mobileView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        mobileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        mobileView.widthAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 311/51).isActive = true
        mobileView.topAnchor.constraint(equalTo: mobileLabel.bottomAnchor, constant: 8).isActive = true
        
        mobileTextField.leadingAnchor.constraint(equalTo: mobileView.leadingAnchor, constant: 10 ).isActive = true
        mobileTextField.trailingAnchor.constraint(equalTo: mobileView.trailingAnchor, constant: 10).isActive = true
        mobileTextField.centerYAnchor.constraint(equalTo: mobileView.centerYAnchor, constant: 0).isActive = true
        
        aadhaarLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        aadhaarLabel.topAnchor.constraint(equalTo: mobileView.bottomAnchor, constant: 15).isActive = true
        
        aadhaarView.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 1).isActive = true
        aadhaarView.heightAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 1).isActive = true
        aadhaarView.topAnchor.constraint(equalTo: aadhaarLabel.bottomAnchor, constant: 8).isActive = true
        aadhaarView.leadingAnchor.constraint(equalTo: mobileView.leadingAnchor, constant: 0).isActive = true
        
        aadhaarTextField.leadingAnchor.constraint(equalTo: aadhaarView.leadingAnchor, constant: 10 ).isActive = true
        aadhaarTextField.trailingAnchor.constraint(equalTo: aadhaarView.trailingAnchor, constant: 10).isActive = true
        aadhaarTextField.centerYAnchor.constraint(equalTo: aadhaarView.centerYAnchor, constant: 0).isActive = true
        
        newPassLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        newPassLabel.topAnchor.constraint(equalTo: aadhaarView.bottomAnchor, constant: 15).isActive = true
        
        newPassView.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 1).isActive = true
        newPassView.heightAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 1).isActive = true
        newPassView.topAnchor.constraint(equalTo: newPassLabel.bottomAnchor, constant: 8).isActive = true
        newPassView.leadingAnchor.constraint(equalTo: mobileView.leadingAnchor, constant: 0).isActive = true
        
        newPassTextField.leadingAnchor.constraint(equalTo: newPassView.leadingAnchor, constant: 10 ).isActive = true
        newPassTextField.trailingAnchor.constraint(equalTo: newPassView.trailingAnchor, constant: 10).isActive = true
        newPassTextField.centerYAnchor.constraint(equalTo: newPassView.centerYAnchor, constant: 0).isActive = true
        
        confirmPassLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        confirmPassLabel.topAnchor.constraint(equalTo: newPassView.bottomAnchor, constant: 15).isActive = true
        
        confirmPassView.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 1).isActive = true
        confirmPassView.heightAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 1).isActive = true
        confirmPassView.topAnchor.constraint(equalTo: confirmPassLabel.bottomAnchor, constant: 8).isActive = true
        confirmPassView.leadingAnchor.constraint(equalTo: mobileView.leadingAnchor, constant: 0).isActive = true
        
        confirmPassTextField.leadingAnchor.constraint(equalTo: confirmPassView.leadingAnchor, constant: 10 ).isActive = true
        confirmPassTextField.trailingAnchor.constraint(equalTo: confirmPassView.trailingAnchor, constant: 10).isActive = true
        confirmPassTextField.centerYAnchor.constraint(equalTo: confirmPassView.centerYAnchor, constant: 0).isActive = true
        
        registerDoneView.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 1).isActive = true
        registerDoneView.heightAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 1).isActive = true
        registerDoneView.leadingAnchor.constraint(equalTo: mobileView.leadingAnchor, constant: 0).isActive = true
        registerDoneView.topAnchor.constraint(equalTo: confirmPassView.bottomAnchor, constant: 35).isActive = true
        
        registerDoneLabel.centerXAnchor.constraint(equalTo: registerDoneView.centerXAnchor, constant: 0).isActive = true
        registerDoneLabel.centerYAnchor.constraint(equalTo: registerDoneView.centerYAnchor, constant: 0).isActive = true
        
        registerDoneButton.centerXAnchor.constraint(equalTo: registerDoneView.centerXAnchor, constant: 0).isActive = true
        registerDoneButton.centerYAnchor.constraint(equalTo: registerDoneView.centerYAnchor, constant: 0).isActive = true
        registerDoneButton.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 1).isActive = true
        registerDoneButton.heightAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 1).isActive = true
        
        termsPolicesTextView.centerXAnchor.constraint(equalTo: mobileView.centerXAnchor, constant: 0).isActive = true
        termsPolicesTextView.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 3/5).isActive = true
        termsPolicesTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        termsPolicesTextView.topAnchor.constraint(equalTo: registerDoneView.bottomAnchor, constant: 32).isActive = true
        
        loginLabel.topAnchor.constraint(equalTo: termsPolicesTextView.bottomAnchor, constant: 35).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        loginLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        loginButton.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor, constant: 0).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor, constant: 0).isActive = true
        loginButton.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 0).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 0).isActive = true
    }
    
}
