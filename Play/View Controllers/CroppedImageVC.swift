//
//  CroppedImageVC.swift
//  Play
//
//  Created by kevin chiang on 2020/4/15.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class CroppedImageVC: UIViewController {

    var frame: CGRect!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgView = UIImageView(frame: frame)
        view.addSubview(imgView)
        imgView.contentMode = .scaleAspectFit
        imgView.image = image
    }
    
}
