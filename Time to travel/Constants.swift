//
//  Constants.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import Foundation
import UIKit


public struct Fonts {
    static let title3Font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let headlineFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
    static let bodyFont = UIFont.systemFont(ofSize: 17, weight: .regular)
    static let footnoteBoldFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
    static let footnoteStatusFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
    static let footnoteFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    static let captionFont = UIFont.systemFont(ofSize: 12, weight: .regular)
}

public struct Colors {
    static let lightGrayColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
    static var purpleColor = UIColor(red: 161/255, green: 22/255, blue: 204/255, alpha: 1)
    static let blueColor = UIColor(red: 41/255, green: 109/255, blue: 255/255, alpha: 1)
    static let greenColor = UIColor(red: 29/255, green: 179/255, blue: 34/255, alpha: 1)
    static let indigoColor = UIColor(red: 98/255, green: 54/255, blue: 255/255, alpha: 1)
    static let orangeColor = UIColor(red: 255/255, green: 159/255, blue: 79/255, alpha: 1)
    static let navigationBarColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.94)
}

public struct Labels {
    
    static let chooseFlight = "Выберите авиаперелет"
    static let search = "Поиск"
    static let favorits = "Избранные"

    static let departure = "Вылет"
    static let arrive = "Прибытие"
    static let flightDate = "Дата отправления"
    static let pass = "Пассажиры"
    static let eldern = "Взрослый"
    static let child = "Детский"
    static let flightClass = "Класс перелёта"
    static let econom = "Эконом"
    static let business = "Бизнес"
    static let first = "Первый"
    static let purchase = "Перейти к покупке"
}


public struct Constants {
    static let leadingMargin: CGFloat = 16
    static let trailingMargin: CGFloat = -16
    static let indent: CGFloat = 12
    static let inset: CGFloat = 8
    
    static let topSectionInset: CGFloat = 22
    static let bottomSectionInset: CGFloat = 12
    static let heightOfInformationTitle: CGFloat = 40
    static let heightOfTimePicker: CGFloat = 200
    static let colorPickerSide: CGFloat = 30
    static let checkerSide: CGFloat = 36
    static let heightFor0Section: CGFloat = 60
    static let heightFor1Section: CGFloat = 130
    
    static let collectionViewCellIndent: CGFloat = 20
    static let collectionViewCellBackIndent: CGFloat = -20
    static let collectionViewCellDoubleIndent: CGFloat = 40
    static let collectionViewCellDoubleBackIndent: CGFloat = -20
    static let collectionViewCellInset: CGFloat = 4
    static let collectionViewCellTrailingMargin: CGFloat = -25

}

public extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
          subviews.forEach { addSubview($0) }
      }
}
