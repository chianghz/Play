//
//  ViewController.swift
//  Play
//
//  Created by kevin chiang on 2020/3/5.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let strings = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]
    var index = 0

    let types: [CATransitionType] = [.fade, .moveIn, .push, .reveal]
    var typeIndex = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func onClickAdd(_ sender: Any) {
        index = min(strings.count-1, index+1)
        startAnimation(string: strings[index], subtype: .fromTop)
    }
    
    @IBAction func onClickMinus(_ sender: Any) {
        index = max(0, index-1)
        startAnimation(string: strings[index], subtype: .fromBottom)
    }
    
    @IBOutlet weak var btnType: UIButton!
    
    @IBAction func onClickType(_ sender: Any) {
        typeIndex = (typeIndex + 1) % 4
        btnType.setTitle(types[typeIndex].rawValue, for: .normal)
    }
    
    override func viewDidLoad() {
        label.text = strings[0]
        btnType.setTitle(types[0].rawValue, for: .normal)
    }

    func startAnimation(string: String, subtype: CATransitionSubtype) {
        
        let animation: CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = types[typeIndex]
        animation.subtype = subtype
        label.text = string
        animation.duration = 0.25
        label.layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
    
}

