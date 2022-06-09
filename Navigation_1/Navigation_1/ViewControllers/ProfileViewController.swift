//
//  ProfileViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 25.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
        
    }()
    
    var buttonTitle: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .blue
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        button.setTitle("Change title", for: .normal)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        profileHeaderView.setConstraint()
        view.addSubview(profileHeaderView)
        view.addSubview(buttonTitle)
        
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
          //  buttonTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            buttonTitle.leftAnchor.constraint(equalTo: view.leftAnchor),
            buttonTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonTitle.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    
    
    
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
    }
    
    
    
    @objc func changeTitle() {
        
        if self.title == "Профиль" {
            self.title = "Аккаунт"
        } else {
            self.title = "Профиль"
        }
        
        
    }
    
    
    
}
