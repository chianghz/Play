//
//  DrawUtility.swift
//  Play
//
//  Created by kevin chiang on 2020/3/18.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class DrawUtility: NSObject {

    static func drawCheckInCircleImage(size: CGSize, lineWidth: CGFloat = 1.0, fillColor: UIColor = #colorLiteral(red: 1, green: 0.7019607843, blue: 0, alpha: 1), checkColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) -> UIImage? {
        
        let width = size.width
        let height = size.height
        let center = CGPoint(x: width / 2.0, y: height / 2.0)
        let verticalOffset = height / 12.0
        let horizontalOffset = width / 12.0
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        let checkPath = UIBezierPath()
        checkPath.move(to: CGPoint(x: center.x - horizontalOffset * 2.7, y: center.y))
        checkPath.addLine(to: CGPoint(x: center.x - horizontalOffset * 1.0, y: center.y + verticalOffset * 2.0))
        checkPath.addLine(to: CGPoint(x: center.x + horizontalOffset * 3.0, y: verticalOffset * 4.0))
        checkPath.lineWidth = lineWidth
        checkPath.lineCapStyle = .round
        checkPath.lineJoinStyle = .round
        
        let radius = (height > width) ? (height / 2.0) - verticalOffset : (width / 2.0) - horizontalOffset
        let circleBezierPath = UIBezierPath(arcCenter: CGPoint(x: width / 2.0, y: height / 2.0), radius: radius, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        circleBezierPath.lineWidth = lineWidth
        UIColor.clear.setStroke()
        fillColor.setFill()
        circleBezierPath.fill()
        circleBezierPath.stroke()
        checkColor.setStroke()
        checkPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
