//
//  Constants.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import Foundation
import UIKit

//MARK: FONTS ======================================================================================

public struct Fonts {
    
    static let unselectedFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    static let selectedFont = UIFont.systemFont(ofSize: 14, weight: .bold)

    static let titleNameFont = UIFont.systemFont(ofSize: 16, weight: .bold)
    static let underTitleNameFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    static let numbersFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let mediumFont = UIFont.systemFont(ofSize: 15, weight: .medium)
    static let largeFont = UIFont.systemFont(ofSize: 24, weight: .bold)
    static let mediumSortLabelFont = UIFont.systemFont(ofSize: 18, weight: .medium)

    static let secondTitleNameFont = UIFont.systemFont(ofSize: 14, weight: .bold)
    static let secondMediumNameFont = UIFont.systemFont(ofSize: 15, weight: .medium)
    static let secondLargeNameFont = UIFont.systemFont(ofSize: 18, weight: .bold)

    static let buttonFont = UIFont.systemFont(ofSize: 16, weight: .bold)

}

//MARK: COLORS ======================================================================================

public struct Colors {
    static let orangeColor = UIColor(red: 252/255, green: 154/255, blue: 125/255, alpha: 1)
    static var backGrayColor = UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
    static let titleGrayColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    static let underTitleGrayColor = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1)
    static let mediumGrayColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    static let purpleColor = UIColor(red: 103/255, green: 96/255, blue: 212/255, alpha: 1)
    
    static let secondTitleGrayColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
    static let secondMediumGrayColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
    static let secondBackGrayColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
    
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
        
    static let infoDescription = "Несмотря на довольно небольшые требования в задании, я постарался максимально влить свою душу и интергировать в проект большую часть своих знаний и умений. Конечно же, за предоставленный срок не всё удалось \"Впихнуть\" в проект, однако здесь ровно столько технологий, сколько должно быть для того, чтобы мне не было стыдно за проект, который будет меня представлять :) \n\nЗдесь я хочу кратко иозложить информацию о технологиях и фичах, применённых мной в процессе написания кода: \n\n - Архитектура MVC (только infoViewController) \n - Singletone (Network manager) \n - Callback (кнопка \"Like\" \n - Facade (создание лейблов и иконок) \n - ООП \n - обработка ошибок (Network manager) \n - парсинг JSON из сети \n - Управление потоками \n\nТак же я постарался максимально эстетично разбить код на части для большего комфорта во время чтения, использовал градиенты и наимацию для улучшения UX. \n\nКонечно же, масштабировать данное приложение и дополнять различными технологиями можно бесконечно, но лично я считаю, что написанного мной достаточно для того, чтобы я мог показать свой подход к данному делу, реализация олицетворяет то, с каким удовольствием я исполнял этот проект. \n\nБуду рад обратной связи, и надеюсь, что Вы рассмотрите меня как кандидата в свою команду! С удовольствием стану её частью! \n\nВаш @andreysavie 😊" 
}

    /*
     - MVC ok
     - Singletone ok
     - callback ok
     - Facade ok
     - ООП, Solid ok
     - обработка ошибок ok
     - многопоточность и асинхронка ok
     */


public struct Constants {
    
    static let leadingMargin: CGFloat = 16
    static let trailingMargin: CGFloat = -16
    static let indent: CGFloat = 12
    static let inset: CGFloat = 8
    
    static let topSectionInset: CGFloat = 12
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

public struct Attributes {
    
    static let nabBarItemAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
    static let navBarTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
    static let classSemgentedControlAttributes = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold),
        NSAttributedString.Key.foregroundColor: Colors.secondTitleGrayColor
    ]
    static let flightPropsLabelAttributes = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold),
        NSAttributedString.Key.foregroundColor: Colors.secondTitleGrayColor
    ]
    static let airportNameLabelAttributes = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold),
        NSAttributedString.Key.foregroundColor: Colors.titleGrayColor
    ]
    static let cityLabelAttributes = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium),
        NSAttributedString.Key.foregroundColor: Colors.secondMediumGrayColor
    ]

}

public extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
          subviews.forEach { addSubview($0) }
      }
    
    func getFormattedDate(date: Date, format: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            dateFormatter.locale = Locale(identifier: "ru_RU")
            return dateFormatter.string(from: date)
    }
}


public extension UIView {
    
    func getIcon (name: String, size: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: name, withConfiguration: UIImage.SymbolConfiguration(pointSize: size))?.withTintColor(Colors.secondMediumGrayColor, renderingMode: .alwaysOriginal)
        return imageView
    }
    
    
    func getLabel (text: String, font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }
    
    func getLabelShort (_ attributes: [NSAttributedString.Key : Any], text: String) -> UILabel {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: text, attributes: attributes)
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

public extension UIViewController {
    
    func getGradient(start: CGPoint, end: CGPoint) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            GradientColors.foneFirstColor.cgColor,
            GradientColors.foneSecondColor.cgColor,
            GradientColors.foneThirdColor.cgColor
        ]
        gradient.startPoint = start
        gradient.endPoint = end

        gradient.locations = [0, 0.55, 1]
        return gradient
    }
}

public extension Date {
    func days(to secondDate: Date, calendar: Calendar = Calendar.current) -> Int {
        return calendar.dateComponents([.day], from: self, to: secondDate).day!
    }
}

func convertDate (longDate: String, format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from:longDate)!
    
    let newDateFormatter = DateFormatter()
    newDateFormatter.dateFormat = format
    return newDateFormatter.string(from: date)
}

func convertToDate (strDate: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return dateFormatter.date(from:strDate)!
}

