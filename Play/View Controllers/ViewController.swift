//
//  ViewController.swift
//  Play
//
//  Created by kevin chiang on 2020/3/5.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myLabel: UILabel!
    
    var triangleView: TriangleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: 0, width: 180, height: 140)
        triangleView = TriangleView(frame: frame, percent: 0.2)
        view.addSubview(triangleView)
        triangleView.center = view.center
    }
    
    @IBAction func onSliderDragged(_ sender: Any) {
        myLabel.text = String(format: "%.2f", mySlider.value)
        triangleView.setPercentage(CGFloat(mySlider.value))
    }
    
}
