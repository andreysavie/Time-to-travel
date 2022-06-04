//
//  InfoViewController.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 04.06.2022.
//


import UIKit

class InfoViewController: UIViewController {

    private lazy var mainView = InfoView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
}

