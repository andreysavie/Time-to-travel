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
    
    private lazy var sortImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.up.arrow.down", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32))
        image.tintColor = .white
        image.backgroundColor = Colors.purpleColor
        return image
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
        contentView.addSubviews(sortingTypeLabel, sortImage)
        
        sortingTypeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(sortImage.snp.leading).offset(12)
        }
        
        sortImage.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
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








