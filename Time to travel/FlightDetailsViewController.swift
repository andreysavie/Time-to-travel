//
//  FlightViewController.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import UIKit

class FlightDetailsViewController: UIViewController {

    // MARK: PROPERTIES ==============================================================================

    private var flight: Flight?
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
        tableView.backgroundColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return tableView
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map")
        image.tintColor = .black
        return image
    }()
    
    // MARK: Повтор!
    
    
    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            GradientColors.foneFirstColor.cgColor,
            GradientColors.foneSecondColor.cgColor,
            GradientColors.foneThirdColor.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0, 0.55, 1]
        return gradient
    }()
    
    // MARK: INITS ==============================================================================

    init (flight: Flight?) {
        super.init(nibName: nil, bundle: nil)
        self.flight = flight
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)

        // MARK: починить картинку!
        self.tableView.addSubview(backgroundImage)
        self.view.addSubview(tableView)
                
        setupLayout()
        
        tableView.register(FlightPropsTableViewCell.self, forCellReuseIdentifier: FlightPropsTableViewCell.identifirer)
        tableView.register(FlightDateTableViewCell.self, forCellReuseIdentifier: FlightDateTableViewCell.identifirer)
        tableView.register(PassengersTableViewCell.self, forCellReuseIdentifier: PassengersTableViewCell.identifirer)
        tableView.register(FlightClassTableViewCell.self, forCellReuseIdentifier: FlightClassTableViewCell.identifirer)
        tableView.register(PurshaseButtonTableViewCell.self, forCellReuseIdentifier: PurshaseButtonTableViewCell.identifirer)
        
    
        tableView.dataSource = self
        tableView.delegate = self
        
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(),
            style: .plain ,
            target: self,
            action: #selector(tapOnLikeButton)
        )
        
        rightBarButtonItem.tintColor = Colors.underTitleGrayColor
        navigationItem.rightBarButtonItem = rightBarButtonItem
        checkIsLiked()
    }
    
    // MARK: METHODS ==============================================================================

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(200)
            make.top.equalTo(tableView).offset(50)
        }
    }
    
    private func checkIsLiked() {
        
        guard let flight = self.flight else { return }
        let heart = flight.isLiked ? "heart.fill" : "heart"
        let color = flight.isLiked ? Colors.likeRedColor : Colors.underTitleGrayColor
        
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: heart, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))
            navigationItem.rightBarButtonItem?.tintColor = color

    }
    // MARK: Objc METHODS ==============================================================================
    
    @objc private func tapOnLikeButton() {
        
        flight?.isLiked.toggle()
        
        guard let row = NetworkManager.shared.flightsArray.firstIndex(where: {$0.searchToken == flight?.searchToken}), let flight = flight else { return }

        NetworkManager.shared.flightsArray[row] = flight
        checkIsLiked()
    }
    
}


extension FlightDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FlightPropsTableViewCell.identifirer,
                for: indexPath) as! FlightPropsTableViewCell
            guard let flight = flight else { return UITableViewCell() }
            cell.configureOfCell(flight: flight)
            cell.selectionStyle = .none
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FlightDateTableViewCell.identifirer,
                for: indexPath) as! FlightDateTableViewCell
            guard let flight = flight else { return UITableViewCell() }
            cell.configureOfCell(flight: flight)
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PassengersTableViewCell.identifirer,
                for: indexPath) as! PassengersTableViewCell
            cell.selectionStyle = .none
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FlightClassTableViewCell.identifirer,
                for: indexPath) as! FlightClassTableViewCell
            cell.selectionStyle = .none
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PurshaseButtonTableViewCell.identifirer,
                for: indexPath) as! PurshaseButtonTableViewCell
            cell.selectionStyle = .none
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
        
}

extension FlightDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 115
        case 1:
            return 85
        case 2:
            return 115
        case 3:
            return 100
        case 4:
            return 300
        default:
            return 0
        }
    }
    
}


