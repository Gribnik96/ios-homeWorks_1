//
//  PostViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 25.05.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost =  "Anonymous"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image:
                                                                    UIImage(systemName: "info.circle"), landscapeImagePhone: UIImage(systemName: "info.circle"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(infoAction))
        
        
        setUpView ()
    }
    
    func setUpView () {
        
        self.view.backgroundColor = .gray
        self.navigationItem.title = titlePost
        
    }
    
    
    @objc private func infoAction() {
        let infoVC = InfoViewController()
        //self.navigationController?.pushViewController(infoVC, animated: true)
        infoVC.modalPresentationStyle = .automatic
        self.present(infoVC, animated: true, completion: nil)
    }


}
