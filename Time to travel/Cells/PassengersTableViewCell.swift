//
//  PassengersTableViewCell.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 03.06.2022.
//

import UIKit

class PassengersTableViewCell: UITableViewCell {
    
    static let identifirer = "PassengersTableViewCell"

    private lazy var passengerslabel = getLabel(
        text: "Пассажиры",
        size: 14,
        color: Colors.secondTitleGrayColor,
        weight: .bold
    )
    
    private lazy var adultlabel = getLabel(
        text: "Взрослый",
        size: 14,
        color: Colors.secondMediumGrayColor,
        weight: .bold
    )
    
    private lazy var childlabel = getLabel(
        text: "Детский",
        size: 14,
        color: Colors.secondMediumGrayColor,
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

