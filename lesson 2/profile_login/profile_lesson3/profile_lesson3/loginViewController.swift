//
//  ViewController.swift
//  profile_lesson3
//
//  Created by Nika on 12/26/23.
//

import UIKit
import SnapKit

final class loginViewController: UIViewController {
    
    enum EmailTFStrings: String {
            case placeholder = "Enter email..."
            case labelName = "Email"
            case invalidText = "Invalid email. Example test@test.com"
        }
        
        enum PasswordTFStrings: String {
            case placeholder = "Enter password..."
            case labelName = "Password"
            case invalidText = "Invalid password!"
        }
    
    private let leadingInset: CGFloat = 16
    
    private lazy var titleLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 34, weight: .bold)
        lable.text = "profile"
        return lable
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 32
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var emailTextField: UIValidatableTextField = {
        let textField = UIValidatableTextField()
//rawValue хранит enum в виде строки
        textField.setup(title: EmailTFStrings.labelName.rawValue,
                        placeholder: EmailTFStrings.placeholder.rawValue,
                        invalidTitle: EmailTFStrings.invalidText.rawValue)
        return textField
    }()
    
    
    private lazy var passwordTextField: UIValidatableTextField = {
        let textField = UIValidatableTextField()
        textField.setup(title: PasswordTFStrings.labelName.rawValue,
                        placeholder: PasswordTFStrings.placeholder.rawValue,
                        invalidTitle: PasswordTFStrings.invalidText.rawValue)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .link
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.layer.cornerRadius = 16
//        add action
//        touchUpInside - тык
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupLayout(){
        setupLable()
        setupStackView()
        setupButton()
    }

    private func setupLable(){
        view.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        //        констрейтим либо на соседнюю вью, либо на супер вью
        titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    
    private func setupStackView(){
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
    }

    
    private func setupButton(){
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
    }
    
    @objc private func login(){
//        , = &&
//        guard let email = emailTextField.text,
//              let password = passwordTextField.text
//        else {return}
//        
//        emailTextField.isValid = emailValid(email: email)
//        passwordTextField.isValid = passwordIsValid(password: password)
//        
//        guard emailValid(email: email),
//              passwordIsValid(password: password)
//        else {return}
        
        let profileVC = ProfileViewController()
        profileVC.modalTransitionStyle = .flipHorizontal
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true)
    }
    
    private func emailValid(email: String) -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        guard email.range(of: pattern, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    private func passwordIsValid(password: String) -> Bool {
        let pattern = "^(?=.*[A-Z])(?=.*[a-z]).{8,}$"
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        return passwordPredicate.evaluate(with: password)
    }

}

