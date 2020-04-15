//
//  CroppedImageVC.swift
//  Play
//
//  Created by kevin chiang on 2020/4/15.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class CroppedImageVC: UIViewController {

    var image: UIImage!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = image
    }
    
}
