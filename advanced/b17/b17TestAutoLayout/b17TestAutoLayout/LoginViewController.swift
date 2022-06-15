//
//  LoginViewController.swift
//  b17TestAutoLayout
//
//  Created by Nguyễn Anh Tú on 10/05/2022.
//

import UIKit

class LoginViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LOGIN"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.setTextSpacingBy(value: 3)
        return label
    }()
    
    let centerView: UIView = {
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
//        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.mainColor()
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let passLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let passView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.mainColor().cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    
    let passTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.mainColor()
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let forgotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Forgot?"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.systemFont(ofSize: 12)
        label.layer.opacity = 0.5
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Forgot?", attributes: underlineAttribute)
                label.attributedText = underlineAttributedString
        
        return label
    }()
    
    let forgotBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let loginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mainColor()
        view.layer.cornerRadius = 10
        return view
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let loginBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "New User? Register Here"
        label.textColor = UIColor.mainColor()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "New User? Register Here", attributes: underlineAttribute)
                label.attributedText = underlineAttributedString
        
        return label
    }()
    
    let registerBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.backgroundColor()
                
        configLayout()
    }
    
    func configLayout() {
        
        view.addSubview(titleLabel)
        view.addSubview(centerView)
        
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        centerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        centerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        
        centerView.addSubview(mobileLabel)
        centerView.addSubview(mobileView)
        centerView.addSubview(passLabel)
        centerView.addSubview(passView)
        centerView.addSubview(forgotLabel)
        centerView.addSubview(forgotBtn)
        centerView.addSubview(loginView)
        centerView.addSubview(loginLabel)
        centerView.addSubview(loginBtn)
        centerView.addSubview(registerLabel)
        centerView.addSubview(registerBtn)
        
        mobileView.addSubview(mobileTextField)
        passView.addSubview(passTextField)
        
        mobileLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 0).isActive = true
        mobileLabel.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 0).isActive = true
        
        mobileView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 0).isActive = true
        mobileView.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: 0).isActive = true
        mobileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        mobileView.widthAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 311/51).isActive = true
        mobileView.topAnchor.constraint(equalTo: mobileLabel.bottomAnchor, constant: 8).isActive = true
        
        mobileTextField.leadingAnchor.constraint(equalTo: mobileView.leadingAnchor, constant: 10 ).isActive = true
        mobileTextField.trailingAnchor.constraint(equalTo: mobileView.trailingAnchor, constant: 10).isActive = true
//        mobileTextField.topAnchor.constraint(equalTo: mobileView.topAnchor, constant: 5).isActive = true
//        mobileTextField.bottomAnchor.constraint(equalTo: mobileView.bottomAnchor, constant: 5).isActive = true
        mobileTextField.centerYAnchor.constraint(equalTo: mobileView.centerYAnchor, constant: 0).isActive = true
        
        passLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 0).isActive = true
        passLabel.topAnchor.constraint(equalTo: mobileView.bottomAnchor, constant: 15).isActive = true
        
        forgotLabel.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: 0).isActive = true
        forgotLabel.centerYAnchor.constraint(equalTo: passLabel.centerYAnchor, constant: 0).isActive = true
        
        forgotBtn.leadingAnchor.constraint(equalTo: forgotLabel.leadingAnchor, constant: 0).isActive = true
        forgotBtn.trailingAnchor.constraint(equalTo: forgotLabel.trailingAnchor, constant: 0).isActive = true
        forgotBtn.topAnchor.constraint(equalTo: forgotLabel.topAnchor, constant: 0).isActive = true
        forgotBtn.bottomAnchor.constraint(equalTo: forgotLabel.bottomAnchor, constant: 0).isActive = true
        
        passView.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 1).isActive = true
        passView.heightAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 1).isActive = true
        passView.topAnchor.constraint(equalTo: passLabel.bottomAnchor, constant: 8).isActive = true
        passView.leadingAnchor.constraint(equalTo: mobileView.leadingAnchor, constant: 0).isActive = true
        
        passTextField.leadingAnchor.constraint(equalTo: passView.leadingAnchor, constant: 10).isActive = true
        passTextField.trailingAnchor.constraint(equalTo: passView.trailingAnchor, constant: 10).isActive = true
        passTextField.centerYAnchor.constraint(equalTo: passView.centerYAnchor, constant: 0).isActive = true
        
        loginView.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 1).isActive = true
        loginView.heightAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 1).isActive = true
        loginView.leadingAnchor.constraint(equalTo: mobileView.leadingAnchor, constant: 0).isActive = true
        loginView.topAnchor.constraint(equalTo: passView.bottomAnchor, constant: 35).isActive = true
        
        loginLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor, constant: 0).isActive = true
        loginLabel.centerYAnchor.constraint(equalTo: loginView.centerYAnchor, constant: 0).isActive = true
        
        loginBtn.centerXAnchor.constraint(equalTo: loginView.centerXAnchor, constant: 0).isActive = true
        loginBtn.centerYAnchor.constraint(equalTo: loginView.centerYAnchor, constant: 0).isActive = true
        loginBtn.widthAnchor.constraint(equalTo: mobileView.widthAnchor, multiplier: 1).isActive = true
        loginBtn.heightAnchor.constraint(equalTo: mobileView.heightAnchor, multiplier: 1).isActive = true
        
        registerLabel.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 40).isActive = true
        registerLabel.centerXAnchor.constraint(equalTo: centerView.centerXAnchor, constant: 0).isActive = true
        registerLabel.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: 0).isActive = true
        
        registerBtn.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor, constant: 0).isActive = true
        registerBtn.trailingAnchor.constraint(equalTo: registerLabel.trailingAnchor, constant: 0).isActive = true
        registerBtn.topAnchor.constraint(equalTo: registerLabel.topAnchor, constant: 0).isActive = true
        registerBtn.bottomAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 0).isActive = true
    }
    
}
