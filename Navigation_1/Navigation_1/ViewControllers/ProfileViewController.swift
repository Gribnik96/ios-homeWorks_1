//
//  ProfileViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 25.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    

    var profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
       self.view.addSubview(profileHeaderView)
        
     
    }
    
  
    

      
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        self.profileHeaderView.frame = self.view.bounds
    
        profileHeaderView.createImage()
        profileHeaderView.createNameLabel()
        profileHeaderView.createTextField()
        profileHeaderView.setConstraint()
        self.view.addSubview(profileHeaderView)
       
    }
    
    

}
