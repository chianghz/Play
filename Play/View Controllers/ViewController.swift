//
//  ViewController.swift
//  Play
//
//  Created by kevin chiang on 2020/3/5.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedIndex: Int?
    
    @IBAction func onClickShowDialog(_ sender: Any) {
       
        let dialogVC = DialogVC(title: "視窗標題")
        dialogVC.titleTxtColor = UIColor.blue
        dialogVC.optionTxtColor = UIColor.brown
        dialogVC.delegate = self
        
        let actions = [
            DialogAction(title: "1", handler: { _ in
                print("1")
                self.selectedIndex = 0
            }),
            
            DialogAction(title: "2", handler: { _ in
                print("2")
                self.selectedIndex = 1
            }),
            
            DialogAction(title: "3", handler: {
                _ in print("3")
                self.selectedIndex = 2
            }),
            
            DialogAction(title: "4", handler: { _ in
                print("4")
                self.selectedIndex = 3
            })
        ]
        actions.forEach{ dialogVC.addAction($0) }
        
        if let index = selectedIndex {
            dialogVC.setSelectedIndex(index)
        }
        
        presentDialogViewController(dialogVC,
                                    animationPattern: .zoomInOut,
                                    backgroundViewType: .solid,
                                    dismissButtonEnabled: true,
                                    completion: nil)
        
    }
    
    override func viewDidLoad() {
        
    }
    
}

