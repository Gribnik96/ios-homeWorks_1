//
//  PhotosViewController.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 23.06.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var layot: UICollectionViewFlowLayout = {

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        return layout

    }()

 private lazy var myCollectionView: UICollectionView = {

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layot)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
     
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
        setConstraint()
    }
    
   
    func setConstraint() {

        view.addSubview(myCollectionView)

        NSLayoutConstraint.activate([

            myCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
}


extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        cell.setPhoto(data[indexPath.item])
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

          let noOfCellsInRow = 3
          let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
          let totalSpace = flowLayout.sectionInset.left
              + flowLayout.sectionInset.right
              + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
          let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
          return CGSize(width: size, height: size)

   }
}

