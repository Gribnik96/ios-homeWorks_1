//
//  CollectionViewCell.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 22.06.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    var myImage: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myImage)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        
        NSLayoutConstraint.activate([
            
            myImage.topAnchor.constraint(equalTo: topAnchor),
            myImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            myImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            myImage.leadingAnchor.constraint(equalTo: leadingAnchor)
            
        ])
//        layer.cornerRadius = 6
//        clipsToBounds = true
//        
        
    }
    
    func setPhoto(_ photo: UIImage) {
        
        myImage.image = photo
        
    }
    
//    func setInfo(_ model: CellModel) {
//        
//        myImage.image = model.image
//        
//    }
    
    
}
