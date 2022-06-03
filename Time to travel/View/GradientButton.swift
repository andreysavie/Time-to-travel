//
//  GradientButton.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 03.06.2022.
//

import UIKit

class GradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            GradientColors.buttonFirstColor.cgColor,
            GradientColors.buttonSecondColor.cgColor,
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = 16
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
}
