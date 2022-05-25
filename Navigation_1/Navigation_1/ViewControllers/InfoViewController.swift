//
//  InfoViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 25.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    var alertButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue
        
        self.alertButton = UIButton(frame: CGRect(x: 200, y: 300, width: 120, height: 25))
        self.alertButton.backgroundColor = .yellow

        self.alertButton.setTitle("Alert", for: .normal)
        self.alertButton.setTitleColor(.black, for: .normal)
        self.alertButton.addTarget(self, action: #selector(actionAlert), for: .touchUpInside)
        self.view.addSubview(alertButton)
        
       
    }
    
    
    @objc private func actionAlert() {
        
        let alertController = UIAlertController(title: "Внимание", message: "Что то пошло не так", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        let closeAction = UIAlertAction(title: "Закрыть приложение", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(closeAction)
        print(okAction, closeAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }


}
