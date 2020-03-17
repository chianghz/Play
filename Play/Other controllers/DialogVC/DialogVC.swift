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
        
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
        
    var titleTxtColor = UIColor(hexString: "#2F445E")
    var optionTxtColor = UIColor(hexString: "#373839")
    var onSelectOption: ((Any) -> Void)?
    
    private var myTitle: String?
    private(set) var options = [Any]()
    
    // Initialization
        
    init(title: String, options: [Any]) {
        super.init(nibName: "DialogVC", bundle: nil)
        self.myTitle = title
        self.options = options
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.cornerRadius = 7.5
        view.clipsToBounds = true
        
        lblTitle.text = myTitle
        lblTitle.textColor = titleTxtColor
        
        tableView.register(DialogTableViewCell.nib, forCellReuseIdentifier: DialogTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let screenSize = UIScreen.main.bounds.size
            let heightOffset: CGFloat = 44 + 0.5 + 5
            let estimateHeight = self.tableView.contentSize.height + heightOffset
            self.view.bounds.size.height = min(estimateHeight, screenSize.height * 0.8)
            self.view.bounds.size.width = screenSize.width * 0.8
        }
    }
    
}
