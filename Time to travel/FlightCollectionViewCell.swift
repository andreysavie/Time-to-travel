//
//  FlightCollectionViewCell.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 01.06.2022.
//

import UIKit
import SnapKit

// MARK: УБРАТЬ ПОВТОРЯЮЩИЙСЯ КОД!!!

class FlightCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FlightCollectionViewCell"
    
    var likeButtonAction: (()->())?

    
    // MARK: PROPERTIES ============================================================================

    private var flight: Flight?
    private var isLiked: Bool?
    private var flightLikeAction: (() -> ())?
    
    private lazy var flightNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.titleNameFont
        label.textColor = Colors.titleGrayColor
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var flightDurationLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.underTitleNameFont
        label.textColor = Colors.underTitleGrayColor
        return label
    }()
    
    private lazy var flightDepartureDateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.numbersFont
        label.textColor = Colors.titleGrayColor
        return label
    }()
    
    private lazy var flightReturnDateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.numbersFont
        label.textColor = Colors.titleGrayColor
        return label
    }()
    
    private lazy var departureAirportLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.mediumFont
        label.textColor = Colors.mediumGrayColor
        return label
    }()
    
    private lazy var arrivalAirportLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.mediumFont
        label.textColor = Colors.mediumGrayColor
        return label
    }()
    
    private lazy var departureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane.departure", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))?.withTintColor(Colors.underTitleGrayColor, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    private lazy var arriveIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane.arrival", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))?.withTintColor(Colors.underTitleGrayColor, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.largeFont
        label.textColor = Colors.purpleColor
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
        button.backgroundColor = Colors.backGrayColor
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tapOnLikeButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: INITIALIZATORS ============================================================================
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(
            
            flightNameLabel,
            flightDurationLabel,
            flightDepartureDateLabel,
            flightReturnDateLabel,
            departureAirportLabel,
            arrivalAirportLabel,
            priceLabel,
            likeButton,
            departureIcon,
            arriveIcon
        )
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: METHODS ===================================================================================
    
    func setConfigureOfCell(flight: Flight) {
        
        self.flight = flight
        self.isLiked = flight.isLiked
        
        flightNameLabel.text = "\(flight.departureCity.uppercased()) ⇆ \(flight.arrivalCity.uppercased())"
        flightDurationLabel.text = "На 12 дней"
        
        flightDepartureDateLabel.text = "\(getFormattedDate(date: flight.departureDate, format: "dd.MM"))"
        flightReturnDateLabel.text = "\(getFormattedDate(date: flight.returnDate, format: "dd.MM"))"
        
        departureAirportLabel.text = "\(flight.departureAirport.uppercased()) - \(flight.arrivalAirport.uppercased())"
        arrivalAirportLabel.text = "\(flight.arrivalAirport.uppercased()) - \(flight.departureAirport.uppercased())"
        
        priceLabel.text = "\(flight.price) ₽"

        if isLiked == true {
            self.likeButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
            self.likeButton.tintColor = Colors.likeRedColor
        } else {
            self.likeButton.setImage(UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
            self.likeButton.tintColor = Colors.underTitleGrayColor
        }
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        
        flightNameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(8)
        }
        
        flightDurationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(flightNameLabel.snp.bottom).offset(3)
        }
        
        
        departureIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(flightDurationLabel.snp.bottom).offset(12)
        }
        
        departureAirportLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(departureIcon.snp.bottom).offset(6)
        }
        
        flightDepartureDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(departureIcon)
            make.trailing.equalTo(departureAirportLabel.snp.trailing)
        }
        
        
        arriveIcon.snp.makeConstraints { make in
            make.centerY.equalTo(departureIcon)
            make.leading.equalTo(flightDepartureDateLabel.snp.trailing).offset(32)
        }
        
        arrivalAirportLabel.snp.makeConstraints { make in
            make.centerY.equalTo(departureAirportLabel)
            make.leading.equalTo(arriveIcon)
        }
        
        flightReturnDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(arriveIcon)
            make.trailing.equalTo(arrivalAirportLabel.snp.trailing)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(8)
        }
        
        likeButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(8)
            make.width.height.equalTo(36)
        }
    }
    
    // MARK: Objc METHODS ==============================================================================

    @objc private func tapOnLikeButton() {
        likeButtonAction?()
    }
}
