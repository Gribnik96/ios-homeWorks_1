//
//  ProfileViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 25.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
   lazy var tableView: UITableView = {
        
       let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "MyView")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
    
    
    let contentArray: [Model] = Mock.shared.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    
    }
}

extension ProfileViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let article = self.contentArray[indexPath.row]
        cell.setInfo(article)
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyView") as? ProfileHeaderView else { return nil }
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
}
