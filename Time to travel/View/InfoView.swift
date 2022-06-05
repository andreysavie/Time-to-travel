//
//  InfoView.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 04.06.2022.
//

import UIKit
import SnapKit

class InfoView: UIView {
    
    var infoScrollView: UIScrollView = {
        let scrollVIew = UIScrollView()
        return scrollVIew
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private lazy var informationTitle: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать в тестовый проект!"
        label.numberOfLines = 2
        label.textColor = Colors.titleGrayColor
        label.font = Fonts.largeFont
        return label
    }()
    
    private lazy var informationTextView: UITextView = {
        let textView = UITextView()
        textView.text = Labels.infoDescription
        textView.font = Fonts.mediumFont
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    // MARK: INITS ============================================================================
    
    init() {
        super.init(frame: .zero)
        addSubview(infoScrollView)
        infoScrollView.addSubview(contentView)
        infoScrollView.contentSize = self.informationTextView.bounds.size
        contentView.addSubviews(informationTitle, informationTextView)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: METHODS ===================================================================================
    
    private func setupLayout() {
 
        infoScrollView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.leading.top.trailing.centerX.centerY.equalTo(infoScrollView)
            make.bottom.equalTo(infoScrollView).inset(16)
        }
        
        informationTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(Constants.leadingMargin)
            make.leading.equalTo(contentView).offset(Constants.leadingMargin)
            make.trailing.equalTo(contentView).offset(Constants.trailingMargin)
        }
        
        informationTextView.snp.makeConstraints { make in
            make.top.equalTo(informationTitle.snp.bottom)
            make.leading.equalTo(contentView).offset(Constants.leadingMargin)
            make.trailing.equalTo(contentView).offset(Constants.trailingMargin)
            make.bottom.equalTo(contentView)
        }
    }
    
}
