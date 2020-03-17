//
//  DialogVC.swift
//  Play
//
//  Created by kevin chiang on 2020/3/16.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class DialogVC: UIViewController {

    var onCloseDialog: (() -> Void)?
    
    @IBAction func onClickBtnClose(_ sender: Any) {
        onCloseDialog?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bounds.size.height = UIScreen.main.bounds.size.height * 0.6
        view.bounds.size.width = UIScreen.main.bounds.size.width * 0.8
    }

}
