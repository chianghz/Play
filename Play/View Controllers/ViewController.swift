//
//  ViewController.swift
//  Play
//
//  Created by kevin chiang on 2020/3/5.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 0, y: 0, width: 300, height: 300)
        let circleView = CircleView(frame: rect, borderWidth: 20, primaryNumber: 3, secondaryNumber: 1)
        
        view.addSubview(circleView)
        circleView.center = view.center
    }
    
}

