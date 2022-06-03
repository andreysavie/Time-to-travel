//
//  ViewController.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import UIKit
import SnapKit

class FlightsListViewController: UIViewController {
    
    static var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.indent
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: Constants.topSectionInset, left: 0, bottom: Constants.bottomSectionInset, right: 0)
        return layout
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let rightBarButtonItem = UIBarButtonItem (
            image: UIImage(systemName: "heart"),
            style: .plain ,
            target: self,
            action: #selector(likeButtonPressed))
        rightBarButtonItem.tintColor = Colors.purpleColor
        return rightBarButtonItem
    }()
    
    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            GradientColors.foneFirstColor.cgColor,
            GradientColors.foneSecondColor.cgColor,
            GradientColors.foneThirdColor.cgColor
        ]
                
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        gradient.locations = [0, 0.55, 1]
        return gradient
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: FlightsListViewController.layout
        )
        collectionView.backgroundColor = .clear
        
        collectionView.register(
            FlightCollectionViewCell.self,
            forCellWithReuseIdentifier: FlightCollectionViewCell.identifier)
        //        collection.register(
        //            ProgressCollectionViewCell.self,
        //            forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    private func setupLayout() {
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func likeButtonPressed() {
        
    }
    
}



extension FlightsListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flightsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlightCollectionViewCell.identifier, for: indexPath) as? FlightCollectionViewCell else { return UICollectionViewCell() }
        cell.setConfigureOfCell(flight: flightsArray[indexPath.row])
        
        cell.likeButtonAction = { [weak self] in
            flightsArray[indexPath.row].isLiked.toggle()
            self?.collectionView.reloadData()
        }
        
        return cell
        
    }
    
    
}

extension FlightsListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let flightDetailsViewController = FlightDetailsViewController(flight: flightsArray[indexPath.row])
        navigationController?.pushViewController(flightDetailsViewController, animated: true)
//        navigationController?.present(flightDetailsViewController, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension FlightsListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: floor(collectionView.frame.width - 32), height: 130)
    }
}
