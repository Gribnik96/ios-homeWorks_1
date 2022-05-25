//
//  FeedViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 25.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Мой пост")

    var tabBarButton = UIBarButtonItem()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        self.button = UIButton(type: .system)
        
        self.button.backgroundColor = .yellow
        self.button.layer.cornerRadius = 17
        self.button.clipsToBounds = true
        self.button.tintColor = .black
        self.button.setTitle("Перейти на пост", for: .normal)
        self.view.addSubview(button)
        self.button.center = self.view.center
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
        self.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
 
        

    }
    
    
         
    
   
    @objc private func buttonAction() {
           let postViewController = PostViewController()
        postViewController.titlePost = post.title
           self.navigationController?.pushViewController(postViewController, animated: true)
       }
    
    
    
}
