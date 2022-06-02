//
//  FlightViewController.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import UIKit

class FlightDetailsViewController: UIViewController {

    private var flight: Flight?
    private var flightName: String = ""
    
    private let tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
//        tableView.sectionHeaderHeight = UITableView.automaticDimension
//        tableView.estimatedSectionHeaderHeight = 220
        tableView.backgroundColor = .white
//        tableView.rowHeight = UITableView.automaticDimension
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
                
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        gradient.locations = [0, 0.55, 1]
        return gradient
    }()
    
    
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

        self.view.addSubview(tableView)
        self.tableView.addSubview(backgroundImage)
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(250)
            make.top.equalTo(tableView).offset(100)
        }
        
        tableView.register(FlightPropsTableViewCell.self, forCellReuseIdentifier: FlightPropsTableViewCell.identifirer)
        
        tableView.register(FlightDateTableViewCell.self, forCellReuseIdentifier: FlightDateTableViewCell.identifirer)

        tableView.register(PassengersTableViewCell.self, forCellReuseIdentifier: PassengersTableViewCell.identifirer)

        tableView.register(FlightClassTableViewCell.self, forCellReuseIdentifier: FlightClassTableViewCell.identifirer)

        tableView.register(PurshaseButtonTableViewCell.self, forCellReuseIdentifier: PurshaseButtonTableViewCell.identifirer)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}

/*
 FlightPropsTableViewCell
 FlightDateTableViewCell
 PassengersTableViewCell
 FlightClassTableViewCell
 PurshaseButtonTableViewCell
 */
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
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FlightDateTableViewCell.identifirer,
                for: indexPath) as! FlightDateTableViewCell
            guard let flight = flight else { return UITableViewCell() }
            cell.configureOfCell(flight: flight)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PassengersTableViewCell.identifirer,
                for: indexPath) as! PassengersTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FlightClassTableViewCell.identifirer,
                for: indexPath) as! FlightClassTableViewCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PurshaseButtonTableViewCell.identifirer,
                for: indexPath) as! PurshaseButtonTableViewCell
            return cell
            
        default:
            return UITableViewCell()
        }
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
            return 200
        default:
            return 0
        }
    }
    
}


class FlightPropsTableViewCell: UITableViewCell {
    
    static let identifirer = "FlightPropsTableViewCell"
    
    private lazy var departurelabel = getLabel(
        text: "Вылет",
        size: 14,
        color: .lightGray,
        weight: .bold
    )
    
    private lazy var arrivallabel = getLabel(
        text: "Прибытие",
        size: 14,
        color: .lightGray,
        weight: .bold
    )
    
    private lazy var departureAirportNameLabel = getLabel(
        text: "",
        size: 24,
        color: .black,
        weight: .bold
    )
    
    private lazy var arrivalAirportNameLabel = getLabel(
        text: "",
        size: 24,
        color: .black,
        weight: .bold
    )
    
    private lazy var departureCityLabel = getLabel(
        text: "",
        size: 15,
        color: .gray,
        weight: .medium
    )
    
    private lazy var arrivalCityLabel = getLabel(
        text: "",
        size: 15,
        color: .gray,
        weight: .medium
    )
        
    private lazy var departureIcon = getIcon(
        name: "airplane.departure",
        size: 25
    )
    private lazy var arrivalIcon = getIcon(
        name: "airplane.arrival",
        size: 25
    )
    
    func configureOfCell(flight: Flight) {
        self.departureAirportNameLabel.text = flight.departureAirport
        self.arrivalAirportNameLabel.text = flight.arrivalAirport
        self.departureCityLabel.text = flight.departureCity
        self.arrivalCityLabel.text = flight.arrivalCity
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubviews(
            departurelabel,
            arrivallabel,
            departureAirportNameLabel,
            arrivalAirportNameLabel,
            departureCityLabel,
            arrivalCityLabel,
            departureIcon,
            arrivalIcon
        )
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        // left side
        
        departurelabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(16)
        }
        
        departureIcon.snp.makeConstraints { make in
            make.top.equalTo(departurelabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
        }
        
        departureAirportNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(departureIcon.snp.trailing).offset(8)
            make.centerY.equalTo(departureIcon)
        }
        
        departureCityLabel.snp.makeConstraints { make in
            make.top.equalTo(departureIcon.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
        }
        
        // right side

        arrivallabel.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(16)
        }
        
        arrivalAirportNameLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(arrivallabel.snp.bottom).offset(8)
        }
        
        arrivalIcon.snp.makeConstraints { make in
            make.trailing.equalTo(arrivalAirportNameLabel.snp.leading).offset(-8)
            make.top.equalTo(arrivallabel.snp.bottom).offset(8)
        }
        
        arrivalCityLabel.snp.makeConstraints { make in
            make.top.equalTo(arrivalIcon.snp.bottom).offset(8)
            make.trailing.equalToSuperview().inset(16)
        }

    }
}

class FlightDateTableViewCell: UITableViewCell {
    
    static let identifirer = "FlightDateTableViewCell"

    private lazy var datelabel = getLabel(
        text: "Дата отправления",
        size: 14,
        color: .lightGray,
        weight: .bold
    )
    
    private lazy var calendarIcon = getIcon(
        name: "calendar",
        size: 15
    )
    
    private lazy var flightDate = getLabel(
        text: "",
        size: 18,
        color: .darkGray,
        weight: .bold
    )
    

    
    func configureOfCell(flight: Flight) {
        self.flightDate.text = getFormattedDate(date: flight.departureDate, format: "E, dd MMMM")

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
                
        contentView.backgroundColor = .clear
        contentView.addSubviews(
            datelabel,
            calendarIcon,
            flightDate
        )

        datelabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(16)
        }
        
        calendarIcon.snp.makeConstraints { make in
            make.top.equalTo(datelabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
        }
        
        flightDate.snp.makeConstraints { make in
            make.leading.equalTo(calendarIcon.snp.trailing).offset(8)
            make.centerY.equalTo(calendarIcon)
        }
    }
    
}

class PassengersTableViewCell: UITableViewCell {
    
    static let identifirer = "PassengersTableViewCell"

    private lazy var passengerslabel = getLabel(
        text: "Пассажиры",
        size: 14,
        color: .lightGray,
        weight: .bold
    )
    
    private lazy var adultlabel = getLabel(
        text: "Взрослый",
        size: 14,
        color: .darkGray,
        weight: .bold
    )
    
    private lazy var childlabel = getLabel(
        text: "Детский",
        size: 14,
        color: .darkGray,
        weight: .bold
    )
    
    private lazy var adultIcon = getIcon(
        name: "person.fill",
        size: 15
    )
    
    private lazy var childIcon = getIcon(
        name: "face.smiling",
        size: 15
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubviews(
            passengerslabel,
            adultlabel,
            childlabel,
            adultIcon,
            childIcon
        )
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func configureOfCell(flight: Flight) {
//        self.flightDate.text = getFormattedDate(date: flight.departureDate, format: "E, dd MMMM")
//
//    }
    
    private func setupLayout() {
        
        passengerslabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(16)
        }
        
        adultIcon.snp.makeConstraints { make in
            make.top.equalTo(passengerslabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
        adultlabel.snp.makeConstraints { make in
            make.leading.equalTo(adultIcon.snp.trailing).offset(8)
            make.centerY.equalTo(adultIcon)
        }
        
        childIcon.snp.makeConstraints { make in
            make.top.equalTo(adultIcon.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
        childlabel.snp.makeConstraints { make in
            make.leading.equalTo(childIcon.snp.trailing).offset(8)
            make.centerY.equalTo(childIcon)
        }

    }
}

class FlightClassTableViewCell: UITableViewCell {
    
    static let identifirer = "FlightClassTableViewCell"

    private let classes = ["Эконом", "Бизнес", "Первый"]
    
    private lazy var classlabel = getLabel(
        text: "Класс перелёта",
        size: 14,
        color: .lightGray,
        weight: .bold
    )
    
    let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)]

    private lazy var classSemgentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: classes)
        control.selectedSegmentIndex = 1
        control.tintColor = .darkGray
        control.backgroundColor = .lightGray
        control.setTitleTextAttributes(attributes, for: .normal)
        control.selectedSegmentTintColor = .white
        // TODO: ADD TARGET!
        return control
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubviews(
            classlabel,
            classSemgentedControl
        )
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func configureOfCell(flight: Flight) {
//        self.flightDate.text = getFormattedDate(date: flight.departureDate, format: "E, dd MMMM")
//
//    }
    
    private func setupLayout() {
        
        classlabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(16)
        }
        
        classSemgentedControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(classlabel.snp.bottom).offset(8)
            make.height.equalTo(32)

        }
    }
    
}

class PurshaseButtonTableViewCell: UITableViewCell {
    
    static let identifirer = "PurshaseButtonTableViewCell"
    
    private lazy var purchaseButton: GradientButton = {
        let button = GradientButton()
        button.setTitle("Перейти к покупке", for: .normal)
        button.layer.cornerRadius = 12
        
        button.layer.shadowOffset = CGSize(width: 0.0, height: 10)
        button.layer.shadowRadius = 10
        button.layer.shadowColor = Colors.purpleColor.cgColor
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    private lazy var buttonGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            GradientColors.buttonFirstColor.cgColor,
            GradientColors.buttonSecondColor.cgColor,
        ]
                
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        return gradient
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
//        contentView.addSubview(purchaseButton)
        contentView.addSubview(purchaseButton)

        purchaseButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(56)
            make.height.equalTo(50)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension UITableViewCell {
    
    func getIcon (name: String, size: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: name, withConfiguration: UIImage.SymbolConfiguration(pointSize: size))?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        return imageView
    }

    
    func getLabel (text: String, size: CGFloat, color: UIColor, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.textColor = color
        
        return label
    }
    
    func getButton (title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = UIColor.darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.shadowRadius = 5.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.0
        return button
    }
}

// MARK: УНЕСТИ ОТСЮДА!

class GradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            GradientColors.buttonFirstColor.cgColor,
            GradientColors.buttonSecondColor.cgColor,
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = 16
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
}
