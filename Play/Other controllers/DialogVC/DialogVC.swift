//
//  DialogVC.swift
//  Play
//
//  Created by kevin chiang on 2020/3/16.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class DialogVC: UIViewController {

    // Properties
        
    @IBOutlet weak var tableView: UITableView!
    
    private let heightOffset: CGFloat = 44 + 0.5 + 5
    
    // UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 7.5
        view.clipsToBounds = true
        
        tableView.register(DialogTableViewCell.nib, forCellReuseIdentifier: DialogTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let estimateHeight = self.tableView.contentSize.height + self.heightOffset
            let screenSizeHeight = UIScreen.main.bounds.size.height
            self.view.bounds.size.height = min(estimateHeight, screenSizeHeight * 0.8)
            self.view.bounds.size.width = UIScreen.main.bounds.size.width * 0.8
        }
    }
    
}
