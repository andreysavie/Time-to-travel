//
//  Constants.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import Foundation
import UIKit


public struct Fonts {
    
    static let unselectedFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    static let selectedFont = UIFont.systemFont(ofSize: 14, weight: .bold)

    static let titleNameFont = UIFont.systemFont(ofSize: 16, weight: .bold)
    static let underTitleNameFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    static let numbersFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let mediumFont = UIFont.systemFont(ofSize: 15, weight: .medium)
    static let largeFont = UIFont.systemFont(ofSize: 24, weight: .bold)
    
    static let secondTitleNameFont = UIFont.systemFont(ofSize: 14, weight: .bold)
    static let secondMediumNameFont = UIFont.systemFont(ofSize: 15, weight: .medium)
    
    static let buttonFont = UIFont.systemFont(ofSize: 16, weight: .bold)

}

public struct Colors {
    static let orangeColor = UIColor(red: 252/255, green: 154/255, blue: 125/255, alpha: 1)
    static var backGrayColor = UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
    static let titleGrayColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    static let underTitleGrayColor = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1)
    static let mediumGrayColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    static let purpleColor = UIColor(red: 103/255, green: 96/255, blue: 212/255, alpha: 1)
    
    static let secondTitleGrayColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
    static let secondMediumGrayColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
    
    static let likeRedColor = UIColor(red: 215/255, green: 85/255, blue: 85/255, alpha: 1)
    
}

public struct GradientColors {
    
    static let foneFirstColor = UIColor(red: 103/255, green: 96/255, blue: 212/255, alpha: 1)
    static let foneSecondColor = UIColor(red: 240/255, green: 161/255, blue: 198/255, alpha: 1)
    static let foneThirdColor = UIColor(red: 253/255, green: 196/255, blue: 179/255, alpha: 1)
    
    static let buttonFirstColor = UIColor(red: 103/255, green: 96/255, blue: 212/255, alpha: 1)
    static let buttonSecondColor = UIColor(red: 164/255, green: 53/255, blue: 252/255, alpha: 1)


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
    
//    func registerCells (tableview: UITableView, id: String, cells: UITableViewCell...) {
//        cells.forEach { tableview.register($0, forCellReuseIdentifier: id) }
//    }
//    
    func getFormattedDate(date: Date, format: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            dateFormatter.locale = Locale(identifier: "ru_RU")
            return dateFormatter.string(from: date)
    }

}
