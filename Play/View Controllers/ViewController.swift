//
//  ViewController.swift
//  Play
//
//  Created by kevin chiang on 2020/3/5.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func onClickShowDialog(_ sender: Any) {
       
        let options: [Any] = [1, 2, 0.5, "Play", [1,1]]
        let dialogVC = DialogVC(title: "視窗標題", options: options)
        dialogVC.titleTxtColor = UIColor.blue
        dialogVC.optionTxtColor = UIColor.brown
        
        presentDialogViewController(dialogVC,
                                    animationPattern: .zoomInOut,
                                    backgroundViewType: .solid,
                                    dismissButtonEnabled: true,
                                    completion: nil)
        
        dialogVC.onSelectOption = { [weak self] option in
            print(option)
            
            self?.dismissDialogViewController(.fadeInOut)
        }
    }
    
    override func viewDidLoad() {
        
    }
    
}

