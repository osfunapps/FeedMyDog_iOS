//
//  GradientView.swift
//  FeedMyDog
//
//  Created by Oz Shabat on 03/02/2018.
//  Copyright © 2018 osApps. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
final class StatusBarGradientColor: UINavigationBar {

    //storyboard colors
    @IBInspectable var startColor: UIColor = UIColor.clear
    @IBInspectable var endColor: UIColor = UIColor.clear

    //statics
    private let _STATUS_BAR_HEIGHT = 20

    override func draw(_ rect: CGRect) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.frame = CGRect(x: CGFloat(0),
                y: CGFloat(-_STATUS_BAR_HEIGHT),
                width: rect.width,
                height: rect.height + CGFloat(_STATUS_BAR_HEIGHT))
        gradient.zPosition = -1
        //gradient.frame = frame

        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)

        layer.addSublayer(gradient)
    }
}

