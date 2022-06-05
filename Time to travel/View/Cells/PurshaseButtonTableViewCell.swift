//
//  PurshaseButtonTableViewCell.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 03.06.2022.
//

import UIKit

class PurshaseButtonTableViewCell: UITableViewCell {
    
    static let identifirer = "PurshaseButtonTableViewCell"
    
    // MARK: PROPERTIES ============================================================================

    private lazy var purchaseButton: GradientButton = {
        let button = GradientButton()
        button.setTitle("Перейти к покупке", for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 0.0, height: 10)
        button.layer.shadowRadius = 10
        button.layer.shadowColor = Colors.purpleColor.cgColor
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    // MARK: INITS ============================================================================

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: METHODS ============================================================================

    private func setupLayout() {
        
        contentView.backgroundColor = .clear
        contentView.addSubview(purchaseButton)

        purchaseButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview().inset(56)
            make.height.equalTo(50)
        }
    }
    
}




