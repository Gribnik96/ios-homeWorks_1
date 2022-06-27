//
//  PhotosTableViewCell.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 20.06.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    var whight: CGFloat {
        return 10
    }
    
    var myLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    var myButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    
    
    private lazy  var myCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        return collectionView
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubView()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        
        contentView.addSubview(myLabel)
        contentView.addSubview(myButton)
        contentView.addSubview(myCollectionView)
        
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            myButton.centerYAnchor.constraint(equalTo: myLabel.centerYAnchor),
            myButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            myButton.widthAnchor.constraint(equalToConstant: 30),
            myButton.heightAnchor.constraint(equalToConstant: 20),
            
            myCollectionView.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 12),
            myCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            myCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            myCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            //   myCollectionCell.widthAnchor.constraint(equalToConstant: 40),
            myCollectionView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
}


extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        cell.setPhoto(data[indexPath.row])
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widhtItem = (collectionView.bounds.width - whight * 3) / 4
        return CGSize(width: widhtItem, height: widhtItem)
        
    }
    
    
    
}
