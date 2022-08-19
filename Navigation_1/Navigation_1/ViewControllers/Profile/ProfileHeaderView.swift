//
//  ProfileHeaderView.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 26.05.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    //MARK: - Создаём UI-обьекты
    
    private var statusText: String = ""
    
    let indentifier = "MyView"
    
    lazy var  myImage: UIImageView = {
        
        let image = UIImageView()
        image.frame.size.height = 110
        image.frame.size.width = 110
        image.image = UIImage(named: "Dog")
        image.layer.borderWidth = 3.0
        image.layer.cornerRadius = image.frame.size.width / 2
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        return image
        
    }()
    
   lazy var myName: UILabel = {
      
        let label = UILabel()
        label.bounds.size = CGSize(width: 100, height: 30)
        label.text = "Dog"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
        
    }()
    
   lazy var myLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Waiting for something"
        label.bounds.size = CGSize(width: 200 , height: 30)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
       
    }()
    
  lazy  var myTextField: UITextField = {
        
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Enter text"
        textField.backgroundColor = .white
        textField.indent(size: 10)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
        
    }()
    
    lazy  var myButton: UIButton = {
        
        let button = UIButton()
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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Задаем констрэйнты
    
    
    func setConstraint() {
        
        myImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        myImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        myImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        myName.topAnchor.constraint(equalTo: myImage.topAnchor).isActive = true
        myName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 175).isActive = true
        
        
        myLabel.topAnchor.constraint(equalTo: myName.bottomAnchor, constant: 25).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 175).isActive = true
        
        myTextField.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 25).isActive = true
        myTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 175).isActive = true
        myTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        myButton.topAnchor.constraint(equalTo: myTextField.bottomAnchor, constant: 16).isActive = true
        myButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        myButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        myButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -10).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    
    
    // MARK: - Создаем методы для addTarget (логика)
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusText = textField.text ?? "Error"
        print(statusText)
        
    }
    
    
    @objc func buttonPressed(_ button: UIButton) {
        
    
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


