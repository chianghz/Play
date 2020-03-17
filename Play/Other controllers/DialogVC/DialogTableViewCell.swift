//
//  DialogTableViewCell.swift
//  Play
//
//  Created by kevin chiang on 2020/3/17.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

class DialogTableViewCell: UITableViewCell {

    // Properties
    
    static let reuseIdentifier = "DialogTableViewCell"
    static let nib = UINib(nibName: "DialogTableViewCell", bundle: nil)
    
    @IBOutlet weak var label: UILabel!
    
    // UITableViewCell
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // TODO: Custom your selected style
        contentView.backgroundColor = selected ? .systemOrange : .white
    }
    
}
