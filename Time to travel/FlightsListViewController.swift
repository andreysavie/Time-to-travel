//
//  ViewController.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import UIKit
import SnapKit

class FlightsListViewController: UIViewController {
    
    // MARK: PROPERTIES ============================================================================

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.indent
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: Constants.topSectionInset, left: 0, bottom: Constants.bottomSectionInset, right: 0)
        return layout
    }()
    
    private lazy var sortingTypeAlertController: UIAlertController = {
        
        let alertController = UIAlertController(
            title: "Сортировать по ...",
            message: "",
            preferredStyle: .actionSheet )
        
        let acceptAction = UIAlertAction(title: "DA", style: .default) { (_) -> Void in }
        let declineAction = UIAlertAction(title: "NET", style: .destructive) { (_) -> Void in }
    
        alertController.addAction(acceptAction)
        alertController.addAction(declineAction)
        
        return alertController
    }()
    
    private lazy var gradient = Gradients.flightsListGradient

    
    // MARK: INITS ============================================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(
            FlightCollectionViewCell.self,
            forCellWithReuseIdentifier: FlightCollectionViewCell.identifier
        )

        collectionView.register(
            SortingCollectionViewCell.self,
            forCellWithReuseIdentifier: SortingCollectionViewCell.identifier
        )
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    // MARK: METHODS ============================================================================

    private func setupLayout() {
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

// MARK: EXTENSIONS ============================================================================


extension FlightsListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var sectionsCount = 0
        switch section {
        case 0:
            sectionsCount = 1
        case 1:
            sectionsCount = NetworkManager.shared.flightsArray.count
        default:
            break
        }
        return sectionsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
            
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SortingCollectionViewCell.self), for: indexPath) as? SortingCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
            
        case 1:
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlightCollectionViewCell.identifier, for: indexPath) as? FlightCollectionViewCell else { return UICollectionViewCell() }
        cell.setConfigureOfCell(flight: NetworkManager.shared.flightsArray[indexPath.row])
        
        cell.likeButtonAction = { [weak self] in
            NetworkManager.shared.flightsArray[indexPath.row].isLiked.toggle()
            self?.collectionView.reloadData()
        }
        return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension FlightsListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath {
        case [0,0]:
            navigationController?.present(sortingTypeAlertController, animated: true, completion: nil)
        default:
            let flightDetailsViewController = FlightDetailsViewController(flight: NetworkManager.shared.flightsArray[indexPath.row])
            navigationController?.pushViewController(flightDetailsViewController, animated: true)
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}

extension FlightsListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 0
        switch indexPath.section {
        case 0:
            height = Constants.heightFor0Section
        case 1:
            height = Constants.heightFor1Section
        default:
            break
        }
        return CGSize(width: floor(collectionView.frame.width - 32), height: height)
    }
}
