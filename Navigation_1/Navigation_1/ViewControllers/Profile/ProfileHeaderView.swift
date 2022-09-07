//
//  ProfileHeaderView.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 26.05.2022.
//



import UIKit
import SnapKit

protocol TapGestureDelegate: AnyObject {
    func tappedAvatar(to tap: UIImageView? )
}

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    //MARK: - Создаём UI-обьекты
    
    private var statusText: String = ""
    
    weak var delegete: TapGestureDelegate?
    
    let indentifier = "MyView"
    
    lazy var  myImage: UIImageView = {
        
        var image = UIImageView()
        image.frame.size.height = 110
        image.frame.size.width = 110
        image.image = UIImage(named: "Dog")
        image.layer.borderWidth = 3.0
        image.layer.cornerRadius = image.frame.size.width / 2
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
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
      textField.autocorrectionType = .no
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

        myImage.snp.makeConstraints { image in
            image.top.leading.equalToSuperview().inset(16)
            image.width.equalTo(110)
            image.height.equalTo(110)
        }
        
        myName.snp.makeConstraints { label in
            label.top.equalTo(myImage)
            label.leading.equalTo(175)
        }
        
        myLabel.snp.makeConstraints { label in
            label.top.equalTo(myImage).inset(25)
            label.leading.equalToSuperview().inset(175)
        }
        
        myTextField.snp.makeConstraints { textField in
            textField.top.equalTo(myLabel).inset(25)
            textField.leading.equalToSuperview().inset(175)
            textField.width.equalTo(200)
            textField.height.equalTo(40)
        }
        
        myButton.snp.makeConstraints { button in
            button.top.equalTo(myTextField).inset(60)
            button.leading.equalToSuperview().inset(16)
            button.trailing.equalToSuperview().inset(16)
            button.bottom.equalToSuperview().inset(10)
            button.height.equalTo(50)
        }
    }
    
    func configure(_ user: User) {
        myImage.image = user.avatar
        myName.text = user.userName
        myLabel.text = user.status
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




