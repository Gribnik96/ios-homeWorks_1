//
//  LogInViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 06.06.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    let scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
        
    }()
    
    
    var myLogoImage: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    var stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.spacing = 0.25
        stackView.backgroundColor = .lightGray
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()
    
    var emailTextField: UITextField = {
        
        let textField = UITextField()
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.indent(size: 10)
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.becomeFirstResponder()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    var passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.indent(size: 10)
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    let image = UIImage(named: "colorButton")
    
    var buttonLogIn: UIButton = {
        
        let button = UIButton()
        let image = UIImage(named: "colorButton") as UIImage?
        button.setBackgroundImage(image, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentView), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(scrollView)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        scrollView.backgroundColor = .white
        scrollView.addSubview(myLogoImage)
        scrollView.addSubview(stackView)
        scrollView.addSubview(buttonLogIn)
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        setConstraints()
        setupGestures()
        
       
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            myLogoImage.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 120),
            myLogoImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            myLogoImage.widthAnchor.constraint(equalToConstant: 100),
            myLogoImage.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: myLogoImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo:scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            buttonLogIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            buttonLogIn.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonLogIn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func presentView() {
        let viewController = ProfileViewController()
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
