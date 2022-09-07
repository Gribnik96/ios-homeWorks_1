//
//  ProfileViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 25.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private var user: User?
    
    init(user: User) {
        
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "MyView")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "MyCell1")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.sectionFooterHeight = 0
        return tableView
    }()
    
    private let button: UIButton = {
        let view = UIButton(type: .close)
        view.setImage(UIImage(named: "dogg"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.isHidden = true
        view.alpha = 0
        return view
    }()

    @objc private func buttonTapped() {
        hideButton() { _ in
            self.resetImage()
        }
    }
    
    private weak var myImageView: UIView?
    
    private var myImageCenter: CGPoint?
    
    private weak var hiderView: UIView?
    
    let profileHeaderView = ProfileHeaderView()
    
    let contentArray: [Model] = Mock.shared.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        tableView.backgroundColor = .white
        #else
        tableView.backgroundColor = .red
        #endif
      
        view.addSubview(tableView)
        view.addSubview(button)
        navigationController?.navigationBar.isHidden = true
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalTo: button.heightAnchor)
        ])
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc  func tapAvatar() {
        guard let header = tableView.headerView(forSection: 0) as? ProfileHeaderView else { return }
        myImageView = header.myImage
        centerImage()
    }

    private func centerImage() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut,
            animations: ({
                guard let center = self.myImageView?.center else { return }
                self.myImageCenter = center
                self.myImageView?.center = self.view.center
                self.myImageView?.transform = .init(scaleX: UIScreen.main.bounds.width / 110, y: UIScreen.main.bounds.width / 110)
                self.myImageView?.layer.cornerRadius = 0
            }),
            completion: ({ _ in
                self.showButton()
            })
        )
    }
    
    private func resetImage() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut,
            animations: ({
                self.myImageView?.transform = .identity
                self.myImageView?.layer.cornerRadius = (self.myImageView?.bounds.width ?? 1) / 2
                guard let myImageCenter = self.myImageCenter else {
                    return
                }
                self.myImageView?.center = myImageCenter
            })
        )
    }
    
    private func showButton() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut,
            animations: ({
                self.button.alpha = 1
                self.button.isHidden = false
            })
        )
    }
    
    private func hideButton(completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut,
            animations: ({
                self.button.alpha = 0
                self.button.isHidden = true
            }),
            completion: completion
        )
    }
}

extension ProfileViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return contentArray.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "MyCell1", for: indexPath) as? PhotosTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let article = self.contentArray[indexPath.row]
        cell.setInfo(article)
        
        
        if indexPath.section == 0 {
            return cell2
        } else {
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let viewController = PhotosViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            section == 0,
            let headerView = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: "MyView"
            ) as? ProfileHeaderView,
            let user = user
        else { return nil }
        headerView.delegete = self
        headerView.configure(user)
        tappedAvatar(to: headerView.myImage)
        return headerView
    }
}
        
       

extension ProfileViewController: TapGestureDelegate {
    func tappedAvatar(to tap: UIImageView?) {
        let tap2 = tap
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAvatar))
        tap2?.addGestureRecognizer(tapGestureRecognizer)
    }
}
