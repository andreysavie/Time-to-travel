//
//  ViewController.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import UIKit

class FlightsListViewController: UIViewController {

    static var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.indent
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: Constants.topSectionInset, left: 0, bottom: Constants.bottomSectionInset, right: 0)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: FlightsListViewController.layout
        )
        collection.backgroundColor = Colors.lightGrayColor
//        collection.register(
//            HabitCollectionViewCell.self,
//            forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
//        collection.register(
//            ProgressCollectionViewCell.self,
//            forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))
        return collection
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }


}

