//
//  FlightClassTableViewCell.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 03.06.2022.
//

import UIKit

class FlightClassTableViewCell: UITableViewCell {
    
    static let identifirer = "FlightClassTableViewCell"

    private let classes = ["Эконом", "Бизнес", "Первый"]
    
    private lazy var classlabel = getLabel(
        text: "Класс перелёта",
        size: 14,
        color: Colors.secondTitleGrayColor,
        weight: .bold
    )
    
    private lazy var classSemgentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: classes)
        control.selectedSegmentIndex = 1
        control.tintColor = Colors.secondBackGrayColor
        control.setTitleTextAttributes(Attributes.classSemgentedControlAttributes, for: .normal)
        control.selectedSegmentTintColor = .white
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
