//
//  FlightPropsTableViewCell.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 03.06.2022.
//

import UIKit

class FlightPropsTableViewCell: UITableViewCell {
    
    // MARK: PROPERTIES ============================================================================

    static let identifirer = "FlightPropsTableViewCell"
    private var flight: Flight?
    
    private lazy var departurelabel = getLabel(
        text: "Вылет",
        size: 14,
        color: Colors.secondTitleGrayColor,
        weight: .bold
    )
    
    private lazy var arrivallabel = getLabel(
        text: "Прибытие",
        size: 14,
        color: Colors.secondTitleGrayColor,
        weight: .bold
    )
    
    private lazy var departureAirportNameLabel = getLabel(
        text: "",
        size: 24,
        color: Colors.titleGrayColor,
        weight: .bold
    )
    
//    private lazy var departureAirportNameLabel = getLabelShort(Attributes.airportNameLabelAttributes, text: flight?.departureAirport ?? "")
    
    private lazy var arrivalAirportNameLabel = getLabel(
        text: "",
        size: 24,
        color: Colors.titleGrayColor,
        weight: .bold
    )
    
    private lazy var departureCityLabel = getLabel(
        text: "",
        size: 15,
        color: Colors.secondMediumGrayColor,
        weight: .medium
    )
    
    private lazy var arrivalCityLabel = getLabel(
        text: "",
        size: 15,
        color: Colors.secondMediumGrayColor,
        weight: .medium
    )
        
    private lazy var departureIcon = getIcon(name: "airplane.departure", size: 25)
    private lazy var arrivalIcon = getIcon(name: "airplane.arrival",size: 25)
    
    
    // MARK: INITIALIZATORS ============================================================================

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
    
    
    // MARK: METHODS ===================================================================================
    
    func configureOfCell(flight: Flight) {
        self.flight = flight
        self.departureAirportNameLabel.text = flight.departureAirport
        self.arrivalAirportNameLabel.text = flight.arrivalAirport
        self.departureCityLabel.text = flight.departureCity
        self.arrivalCityLabel.text = flight.arrivalCity
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
