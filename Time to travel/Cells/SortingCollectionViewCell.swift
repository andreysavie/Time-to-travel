//
//  SortingCollectionViewCell.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 04.06.2022.
//

import UIKit
import SnapKit

class SortingCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "SortingCollectionViewCell"
    
    
    // MARK: PROPERTIES ================================================================================
    
    private lazy var sotringNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Сортировать по ..."
        label.font = Fonts.secondTitleNameFont
        return label
    }()
    
    private lazy var sortingTypeButton: UILabel = {
        let label = UILabel()
        label.text = "Стоимости"
        label.textColor = Colors.titleGrayColor
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var sortButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.up.arrow.down", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)), for: .normal)
        button.tintColor = .white
        button.backgroundColor = Colors.purpleColor
        return button
    }()
    
    
    // MARK: INITIALIZATORS ============================================================================
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: METHODS ===================================================================================
    
    private func setupLayout() {
        
        contentView.addSubviews(sotringNameLabel, sortingTypeButton, sortButton)
        
        sotringNameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(12)
        }
        
        sortingTypeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(sortButton.snp.leading).offset(12)
            make.height.equalTo(20)
        }
        
        sortButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        //            NSLayoutConstraint.activate([
        //                progressNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.indent),
        //                progressNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.indent),
        //
        //                progressProcentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.indent),
        //                progressProcentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.indent),
        //
        //                progressLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.indent),
        //                progressLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.indent),
        //                progressLine.topAnchor.constraint(equalTo: progressNameLabel.bottomAnchor, constant: Constants.indent),
        //                progressLine.heightAnchor.constraint(equalToConstant: Constants.indent / 2),
        //            ])
    }
    
}



