//
//  ViewController.swift
//  Play
//
//  Created by kevin chiang on 2020/3/5.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    let hiddenView = UIView()
    let animatedView = UIView()
    var flag = 0
    
    @IBAction func onClickStartAnimation(_ sender: Any) {
        startAnimation()
    }
    
    @IBAction func onClickStop(_ sender: Any) {
        animatedView.layer.removeAllAnimations()
        animatedView.removeFromSuperview()
    }
    
    @IBAction func onClickSwitchView(_ sender: Any) {
        switch flag {
        case 0:
            view2.addSubview(animatedView)
            animatedView.frame = view2.bounds
            flag = 1
            
        case 1:
            view1.addSubview(animatedView)
            animatedView.frame = view1.bounds
            flag = 0
            
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(hiddenView)
        animatedView.backgroundColor = .white
    }
    
    func startAnimation() {
        
        hiddenView.addSubview(animatedView)
        animatedView.frame = hiddenView.bounds
        
        UIView.animate(withDuration: 2, delay: 0.3, options: [.repeat, .autoreverse], animations: {
            self.animatedView.backgroundColor = UIColor.random()

        }, completion: { _ in
            self.animatedView.backgroundColor = .white
        })
        
    }

}

