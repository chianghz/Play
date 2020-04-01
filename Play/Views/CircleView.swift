//
//  CircleView.swift
//  QSFTGApp
//
//  Created by kevin chiang on 2020/3/26.
//  Copyright © 2020 WeOnlyLiveOnce. All rights reserved.
//
//  參考: https://stackoverflow.com/a/30761714

import UIKit

class CircleView: UIView {

    // MARK: Properties
    
    private var borderWidth: CGFloat!
    
    private let color1 = #colorLiteral(red: 0.7843137255, green: 0.8980392157, blue: 0.9490196078, alpha: 1)
    private let color2 = #colorLiteral(red: 0.2941176471, green: 0.5529411765, blue: 0.6705882353, alpha: 1)
    private let color3 = #colorLiteral(red: 0.5490196078, green: 0.6862745098, blue: 0.4235294118, alpha: 1)
    private let color4 = #colorLiteral(red: 0.8117647059, green: 0.9019607843, blue: 0.6901960784, alpha: 1) 
    lazy private var primaryColors = [color1.cgColor, color2.cgColor]
    lazy private var secondaryColors = [color3.cgColor, color4.cgColor]
    
    private var primaryNumber: Double?
    private var secondaryNumber: Double?
    private let startAngle = CGFloat(-Double.pi / 2)
    private let endAngle = CGFloat(-Double.pi / 2)
    private var middleAngle: CGFloat {
        var ratio: Double!
        switch (primaryNumber, secondaryNumber) {
        case (nil, nil), (0, 0): ratio = 1/2
        case (_, nil), (_, 0): ratio = 1
        case (nil, _), (0, _): ratio = 1/999999
        case (let num1, let num2): ratio = num1! / (num1! + num2!)
        }
        return CGFloat((Double.pi * 2.0 * ratio) - (Double.pi / 2))
    }
    
    // MARK: Initialization
    
    convenience init(frame: CGRect,
                     borderWidth: CGFloat,
                     primaryNumber: Double?,
                     secondaryNumber: Double?) {
        
        self.init(frame: frame)
        
        self.borderWidth = borderWidth
        self.primaryNumber = primaryNumber
        self.secondaryNumber = secondaryNumber
        
        isOpaque = false
    }
    
    override func draw(_ rect: CGRect) {
        
        func addGradient(path: CGPath, colors: [CGColor]) {
            
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = colors
            
            let shapeMask = CAShapeLayer()
            shapeMask.path = path
            shapeMask.lineWidth = borderWidth
            shapeMask.fillColor = UIColor.clear.cgColor
            shapeMask.strokeColor = UIColor.white.cgColor
            
            gradient.mask = shapeMask
            
            self.layer.addSublayer(gradient)
        }
        
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let radius = CGFloat(self.frame.width / 2 - borderWidth)
        let path1 = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: middleAngle, clockwise: true)
        let path2 = UIBezierPath(arcCenter: center, radius: radius, startAngle: middleAngle, endAngle: endAngle, clockwise: true)

        addGradient(path: path1.cgPath, colors: primaryColors)
        addGradient(path: path2.cgPath, colors: secondaryColors)
    }
    
}
