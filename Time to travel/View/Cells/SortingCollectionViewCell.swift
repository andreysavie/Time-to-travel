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
    

    
    private lazy var sortingTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Сортировка"
        label.textColor = Colors.titleGrayColor
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var sortButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.up.arrow.down", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)), for: .normal)
        button.tintColor = .white
        button.isUserInteractionEnabled = false
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
        
        contentView.addSubviews(sortingTypeLabel, sortButton)
        
        
        sortingTypeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(sortButton.snp.leading).offset(12)
        }
        
        sortButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.height.equalTo(80)
        }
    }
    
}





