//
//  ProfileHeaderView.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 26.05.2022.
//

import UIKit

class ProfileHeaderView: UIView,UITextFieldDelegate {
    
    let myImage = UIImageView()
    let myName = UILabel()
   lazy var myLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 34, y: 34, width: 34, height: 23))
        label.text = "Waiting for something"
        label.bounds.size = CGSize(width: 200 , height: 30)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
       addSubview(label)
        return label
    }()
    var myTextField = UITextField()
    lazy  var myButton: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        button.setTitle("Set status", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        addSubview(button)
        
        return button
        
    }()
    private var statusText: String = ""
    
    
    
    
    
    func createImage() {
        
        myImage.frame.size.height = 130
        myImage.frame.size.width = 130
        myImage.image = UIImage(named: "Dog")
        myImage.layer.borderWidth = 3
        myImage.layer.borderColor = UIColor.white.cgColor
        myImage.layer.cornerRadius = myImage.frame.size.width / 2
        myImage.clipsToBounds = true
        myImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(myImage)
        
    }
    
    
    func createNameLabel() {
        
        myName.bounds.size = CGSize(width: 100, height: 30)
        myName.text = "Dog"
        myName.font = UIFont.boldSystemFont(ofSize: 18)
        myName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(myName)
        
        
    }
    
    
    
    
    func createTextField() {
        
        
        myTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        myTextField.textColor = .black
        myTextField.layer.cornerRadius = 12
        myTextField.layer.borderWidth = 1
        myTextField.layer.borderColor = UIColor.black.cgColor
        myTextField.placeholder = "Enter text"
        myTextField.backgroundColor = .white
        myTextField.indent(size: 10)
        
        myTextField.delegate = self
        
        
        myTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        
        
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(myTextField)
        
        
    }
    
    
    
    
    func setConstraint() {
        
        myImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        myImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        myImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        myName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        myName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 175).isActive = true
        
        
        myLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 95).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 175).isActive = true
        
        myTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 125).isActive = true
        myTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 175).isActive = true
        myTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        myButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 175).isActive = true
        myButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        myButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusText = textField.text ?? "Error"
        print(statusText)
    }
    
    
    @objc func buttonPressed(_ button: UIButton) {
        
        print("Click")
        
        print(statusText)
        
        myLabel.text = statusText
        myTextField.endEditing(true)
        myTextField.resignFirstResponder()
        myTextField.text = nil
        print(myLabel.text ?? "Nil")
        
    }
    
    
    
}



extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}


