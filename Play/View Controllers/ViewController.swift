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
        let dialogVC = DialogVC(nibName: "DialogVC", bundle: nil)

        presentDialogViewController(dialogVC)

        dialogVC.onCloseDialog = { [weak self] in
            self?.dismissDialogViewController()
        }
    }
    
    override func viewDidLoad() {
        
    }
    
}

