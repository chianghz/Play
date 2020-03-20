//
//  InformationView.swift
//  Play
//
//  Created by kevin chiang on 2020/3/20.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//
//  Article: https://medium.com/@anandin02/loading-custom-views-in-ios-the-right-way-bedfc06a4fbd

import UIKit

class InformationView: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var aSwitch: UISwitch!
    @IBOutlet weak var aButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
        self.initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadView()
        self.initSubViews()
    }
    
    private func loadView() {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
    }
    
    private func initSubViews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        [containerView.topAnchor.constraint(equalTo: self.topAnchor),
         containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ].forEach{ $0.isActive = true }
    }
    
}
