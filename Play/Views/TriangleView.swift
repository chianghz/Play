//
//  TriangleView.swift
//  Play
//
//  Created by kevin chiang on 2020/4/6.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class TriangleView: UIView {

    // MARK: Colors
    
    private let color_bg_left = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 1, alpha: 1)
    private let color_bg_right_1 = #colorLiteral(red: 0.9215686275, green: 0.9568627451, blue: 1, alpha: 1)
    private let color_bg_right_2 = UIColor.white
    
    private let color1 = #colorLiteral(red: 0.662745098, green: 0.4901960784, blue: 1, alpha: 1)
    private let color2 = #colorLiteral(red: 0.8470588235, green: 0.8235294118, blue: 1, alpha: 1)
    private let color3 = #colorLiteral(red: 0.8235294118, green: 0.7294117647, blue: 0.8980392157, alpha: 1)
    private let color4 = #colorLiteral(red: 0.6509803922, green: 0.6352941176, blue: 0.8470588235, alpha: 1)
    
    lazy private var backgroundColor_left = color_bg_left.cgColor
    lazy private var backgroundColors_right = [color_bg_right_1.cgColor, color_bg_right_2.cgColor]
    lazy private var leftColors = [color2.cgColor, color1.cgColor]
    lazy private var leftColors2 = [color4.cgColor, color3.cgColor]
    lazy private var rightColors = [color1.cgColor, color2.cgColor]
    lazy private var rightColors2 = [color3.cgColor, color4.cgColor]
    
    // MARK: Properties
    
    private var leftView: UIView!
    private var rightView: UIView!
    private var leftGradientLayer: CAGradientLayer!
    private var rightGradientLayer: CAGradientLayer!
    
    private let leftViewAlpha: CGFloat = 0.5
    private let shadowSize: CGFloat = 4.0
    
    // MARK: Initialization

    convenience init(frame: CGRect, percent: CGFloat) {
        self.init(frame: frame)
        
        setupTriangleBackGround_left()
        setupTriangleBackGround_right()
        setupTriangle_left(percent: percent)
        setupTriangle_right(percent: percent)
    }
    
    // MARK: Functions
    
    private func setupTriangleBackGround_left() {
        
        let frame = CGRect(x: 0, y: 0, width: bounds.size.width/2, height: bounds.size.height - shadowSize)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.size.height))
        path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        path.addLine(to: CGPoint(x: frame.size.width, y: 0))
        path.close()
        
        let rightLayer = CAShapeLayer()
        rightLayer.path = path.cgPath
        rightLayer.fillColor = backgroundColor_left
        
        leftView = UIView(frame: frame)
        leftView.alpha = leftViewAlpha
        leftView.layer.addSublayer(rightLayer)
        
        leftView.layer.shadowColor = UIColor.darkGray.cgColor
        leftView.layer.shadowOffset = CGSize(width: 0, height: shadowSize)
        leftView.layer.shadowRadius = shadowSize
        leftView.layer.shadowOpacity = 0.6
        
        self.addSubview(leftView)
        
    }
    
    private func setupTriangleBackGround_right() {

        let frame = CGRect(x: 0, y: 0, width: bounds.size.width/2, height: bounds.size.height - shadowSize)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.size.height))
        path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()

        let rightLayer = CAShapeLayer()
        rightLayer.path = path.cgPath

        let rightGradientLayer = CAGradientLayer()
        rightGradientLayer.frame = frame
        rightGradientLayer.colors = backgroundColors_right
        rightGradientLayer.mask = rightLayer
        
        let point = CGPoint(x: bounds.size.width/2, y: 0)
        rightView = UIView(frame: CGRect(origin: point, size: frame.size))
        rightView.layer.addSublayer(rightGradientLayer)
        
        rightView.layer.shadowColor = UIColor.darkGray.cgColor
        rightView.layer.shadowOffset = CGSize(width: -0.2, height: shadowSize)
        rightView.layer.shadowRadius = shadowSize
        rightView.layer.shadowOpacity = 0.6
        
        self.addSubview(rightView)
        
    }
    
    // Param:
    // percent - From 0 to 1
    
    private func setupTriangle_left(percent: CGFloat) {
        
        let y = leftView.bounds.size.height * (1 - min(1, percent))
        let gradientFrame = CGRect(x: 0, y: y, width: leftView.bounds.size.width, height: leftView.bounds.size.height - y)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientFrame
        
        switch percent {
        case 0.25...1: gradientLayer.colors = leftColors
        case 0...0.25: gradientLayer.colors = leftColors2
        default: break
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: gradientFrame.size.height))
        path.addLine(to: CGPoint(x: gradientFrame.size.width, y: gradientFrame.size.height))
        path.addLine(to: CGPoint(x: gradientFrame.size.width, y: 0))
        path.close()
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        gradientLayer.mask = layer

        leftView.layer.addSublayer(gradientLayer)
        leftGradientLayer = gradientLayer
        
    }
    
    // Param:
    // percent - From 0 to 1
    
    private func setupTriangle_right(percent: CGFloat) {
        
        let y = rightView.bounds.size.height * (1 - min(1, percent))
        let gradientFrame = CGRect(x: 0, y: y, width: rightView.bounds.size.width, height: rightView.bounds.size.height - y)

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientFrame
        
        switch percent {
        case 0.25...1: gradientLayer.colors = rightColors
        case 0...0.25: gradientLayer.colors = rightColors2
        default: break
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: gradientFrame.size.height))
        path.addLine(to: CGPoint(x: gradientFrame.size.width, y: gradientFrame.size.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        gradientLayer.mask = shapeLayer
        
        rightView.layer.addSublayer(gradientLayer)
        rightGradientLayer = gradientLayer
        
    }
    
    func setPercentage(_ percent: CGFloat) {
        leftGradientLayer.removeFromSuperlayer()
        rightGradientLayer.removeFromSuperlayer()
        setupTriangle_left(percent: percent)
        setupTriangle_right(percent: percent)
    }
    
}
