//
//  MyHoleView.swift
//  Play
//
//  Created by kevin chiang on 2020/4/16.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class MyHoleView: UIView {

    // MARK: Properties
        
    var holeFrame: CGRect!
    
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
    
    // MARK: UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Blur View
//        blurView.frame.size = CGSize(width: frame.width, height: frame.height)
//        addSubview(blurView)
        self.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        
        // 製作中空 mask
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        let holePath = UIBezierPath(rect: holeFrame).reversing()
        path.append(holePath)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
    
}
