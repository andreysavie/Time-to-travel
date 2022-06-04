//
//  FlightDateTableViewCell.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 03.06.2022.
//

import UIKit

class FlightDateTableViewCell: UITableViewCell {
    
    static let identifirer = "FlightDateTableViewCell"

    // MARK: PROPERTIES ============================================================================

    private lazy var datelabel = getLabel(
        text: "Дата отправления",
        font: Fonts.secondTitleNameFont,
        color: Colors.secondTitleGrayColor
    )
    
    private lazy var calendarIcon = getIcon(
        name: "calendar",
        size: 15
    )
    
    private lazy var flightDate = getLabel(
        text: "",
        font: Fonts.secondTitleNameFont,
        color: Colors.secondMediumGrayColor
    )
    

    // MARK: INITS ============================================================================

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: METHODS ============================================================================

    func configureOfCell(flight: Flight) {
        self.flightDate.text = convertDate(longDate: flight.startDate, format: "E, dd MMMM")
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

