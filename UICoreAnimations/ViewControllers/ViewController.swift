//
//  ViewController.swift
//  UICoreAnimations
//
//  Created by Mayank Dubey on 23/12/24.
//

import UIKit

enum CellTitles: String, CaseIterable {
    case Move = "Move"
    case Scale = "Scale"
    case Rotate = "Rotate"
    case Shake = "Shake"
    case Circling = "Circling"
}

class ViewController: UIViewController {
    
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Screen"
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.bounds.width, height: 50)
        layout.minimumLineSpacing = 10 // distance btw consecutive rows (vertical)
//        layout.minimumInteritemSpacing = 5 // distance btw consecutive rows (horizontal)
        
        let collectionView: UICollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let title = CellTitles.allCases[indexPath.item].rawValue
        cell.configure(with: title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc: AnimationViewController = AnimationViewController(title: CellTitles.allCases[indexPath.item].rawValue)
        navigationController?.pushViewController(vc, animated: true)
    }
}
