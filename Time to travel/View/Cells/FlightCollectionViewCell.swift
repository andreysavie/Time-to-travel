//
//  FlightCollectionViewCell.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 01.06.2022.
//

import UIKit
import SnapKit

class FlightCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FlightCollectionViewCell"
    
    var likeButtonAction: (()->())?

    // MARK: PROPERTIES ============================================================================

    private var flight: Flight?
    private var isLiked: Bool?
    
    
    private lazy var flightNameLabel = getLabel(
        text: "",
        font: Fonts.titleNameFont,
        color: Colors.titleGrayColor
    )
    
    private lazy var flightDurationLabel = getLabel(
        text: "",
        font: Fonts.underTitleNameFont,
        color: Colors.underTitleGrayColor
    )
    
    private lazy var flightDepartureDateLabel = getLabel(
        text: "",
        font: Fonts.numbersFont,
        color: Colors.titleGrayColor
    )
    
    private lazy var flightReturnDateLabel = getLabel(
        text: "",
        font: Fonts.numbersFont,
        color: Colors.titleGrayColor
    )
    
    private lazy var departureAirportLabel = getLabel(
        text: "",
        font: Fonts.mediumFont,
        color: Colors.mediumGrayColor
    )
    
    private lazy var arrivalAirportLabel = getLabel(
        text: "",
        font: Fonts.mediumFont,
        color: Colors.mediumGrayColor
    )
    
    private lazy var priceLabel = getLabel(
        text: "",
        font: Fonts.largeFont,
        color: Colors.purpleColor
    )
    
    private lazy var departureIcon = getIcon(name: "airplane.departure", size: 18)
    
    private lazy var arriveIcon = getIcon(name: "airplane.arrival", size: 18)
    
    public lazy var likeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.backGrayColor
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tapOnLikeButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: INITS ============================================================================
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: METHODS ===================================================================================
    
    
    func setConfigureOfCell(flight: Flight) {
        
        self.flight = flight
        
        let startDate = convertToDate(strDate: flight.startDate)
        let endDate = convertToDate(strDate: flight.endDate)
        
        let dateDiff = startDate.days(to: endDate)
        
        flightNameLabel.text = "\(flight.startCity.uppercased()) ⇆ \(flight.endCity.uppercased())"
        flightDurationLabel.text = "На \(dateDiff) дней"
        flightDepartureDateLabel.text =  "\(convertDate(longDate: flight.startDate, format: "dd.MM"))"
        flightReturnDateLabel.text = "\(convertDate(longDate: flight.endDate, format: "dd.MM"))"
        departureAirportLabel.text = "\(flight.startCityCode.uppercased()) - \(flight.endCityCode.uppercased())"
        arrivalAirportLabel.text = "\(flight.endCityCode.uppercased()) - \(flight.startCityCode.uppercased())"
        priceLabel.text = "\(flight.price) ₽"
        
        checkIsLiked()
    }
    
    private func setupLayout() {
        
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
    
    private func checkIsLiked() {
        guard let flight = flight else { return }
        let heart = flight.isLiked ? "heart.fill" : "heart"
        let color = flight.isLiked ? Colors.likeRedColor : Colors.underTitleGrayColor
        
        likeButton.setImage(UIImage(systemName: heart, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
        likeButton.tintColor = color
    }
    
    // MARK: Objc METHODS ==============================================================================

    @objc private func tapOnLikeButton() {
        likeButtonAction?()
//        
//        UIView.animate(withDuration: 0.3,
//            animations: {
//                self.likeButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//            },
//            completion: { _ in
//                UIView.animate(withDuration: 0.3) {
//                    self.likeButton.transform = CGAffineTransform.identity
//                }
//            })
        
    }
    
    @objc func animeteTapLikeButton () {
        UIView.animate(withDuration: 0.3,
            animations: {
                self.likeButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.likeButton.transform = CGAffineTransform.identity
                }
            })
    }
}

// MARK: EXTENSIONS ==============================================================================

extension FlightCollectionViewCell {
//
//        func likeAnimation() {
//
//            UIView.animate(withDuration: 0.3,
//                animations: {
//                    self.likeButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//                },
//                completion: { _ in
//                    UIView.animate(withDuration: 0.3) {
//                        self.likeButton.transform = CGAffineTransform.identity
//                    }
//                })
//
//            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
//                self.layer.zPosition = self.isSelected ? 1 : -1
//                self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.05, y: 1.05) : CGAffineTransform.identity
//            }, completion: {_ in
//
//                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
//                    self.layer.zPosition = self.isSelected ? 1 : -1
//                    self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.0, y: 1.0) : CGAffineTransform.identity
//                })
//            })
        }
    

