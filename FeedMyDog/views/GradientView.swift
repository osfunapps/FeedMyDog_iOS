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
final class GradientView: UINavigationBar {

    //storyboard colors
    @IBInspectable var startColor: UIColor = UIColor.clear
    @IBInspectable var endColor: UIColor = UIColor.clear


    override func draw(_ rect: CGRect) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.frame = CGRect(
                x: 0,
                y: 0,
                width: rect.width,
                height: rect.height)
        gradient.zPosition = -1

        //
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)

        layer.addSublayer(gradient)
    }
}

