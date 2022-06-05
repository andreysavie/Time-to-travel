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
    
    private lazy var sortingTypeLabel = getLabel(
        text: "Сортировка",
        font: Fonts.mediumSortLabelFont,
        color: Colors.mediumGrayColor
    )
    
    private lazy var sortButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(
            systemName: "arrow.up.arrow.down",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)
        ), for: .normal)
        button.isUserInteractionEnabled = false
        button.tintColor = .white
        button.backgroundColor = Colors.purpleColor
        return button
    }()
    
    
    // MARK: INITIALIZATORS ============================================================================
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: METHODS ===================================================================================
    
    private func setupLayout() {
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.addSubviews(sortingTypeLabel, sortButton)
        
        sortingTypeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(sortButton.snp.leading).offset(12)
        }
        
        sortButton.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
            make.width.height.equalTo(80)
        }
    }
}

// MARK: SELECTION ANIMATION ============================================================================

extension SortingCollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                self.layer.zPosition = self.isSelected ? 1 : -1
                self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.05, y: 1.05) : CGAffineTransform.identity
            }, completion: {_ in
                
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                    self.layer.zPosition = self.isSelected ? 1 : -1
                    self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.0, y: 1.0) : CGAffineTransform.identity
                })
            })
        }
    }
}








