//
//  InfoViewController.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 04.06.2022.
//


import UIKit
import SnapKit

class InfoViewController: UIViewController {

    // MARK: PROPERTIES ============================================================================

    private lazy var infoScrollView: UIScrollView = {
        let scrollVIew = UIScrollView()
        return scrollVIew
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private lazy var informationTitle: UILabel = {
        let label = UILabel()
        label.text = "Информация"
        label.numberOfLines = 1
        label.textColor = Colors.titleGrayColor
        label.font = Fonts.titleNameFont
        return label
    }()
    
    private lazy var informationTextView: UITextView = {
        let textView = UITextView()
        textView.text = Labels.infoDescription
        textView.font = Fonts.underTitleNameFont
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
 
    // MARK: INITS ============================================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoScrollView)
        infoScrollView.addSubview(contentView)
        infoScrollView.contentSize = self.informationTextView.bounds.size
        contentView.addSubviews(informationTitle, informationTextView)
        setupLayout()
        self.loadViewIfNeeded()
    }
    
    // MARK: METHODS ===================================================================================

    private func setupLayout() {
        
        infoScrollView.snp.makeConstraints({ make in
            make.leading.top.trailing.bottom.equalToSuperview()
        })
        
        contentView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        informationTitle.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(Constants.heightOfInformationTitle)
        }
        
        informationTextView.snp.makeConstraints { make in
            make.top.equalTo(informationTitle.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
//        NSLayoutConstraint.activate([
//            infoScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            infoScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            infoScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            
//            contentView.topAnchor.constraint(equalTo: infoScrollView.topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor),
//            contentView.leadingAnchor.constraint(equalTo: infoScrollView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: infoScrollView.trailingAnchor),
//            contentView.centerXAnchor.constraint(equalTo: infoScrollView.centerXAnchor),
//            contentView.centerYAnchor.constraint(equalTo: infoScrollView.centerYAnchor),
//            
//            informationTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.leadingMargin),
//            informationTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingMargin),
//            informationTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingMargin),
//            informationTitle.heightAnchor.constraint(equalToConstant: Constants.heightOfInformationTitle),
//
//            informationTextView.topAnchor.constraint(equalTo: informationTitle.bottomAnchor),
//            informationTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingMargin),
//            informationTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingMargin),
//            informationTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
    }
}

