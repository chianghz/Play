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
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var selectedIconHeight: NSLayoutConstraint!
    @IBOutlet weak var selectedIconWidth: NSLayoutConstraint!
    
    private let iconDimension: CGFloat = 20.0
    
    // UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        selectedIconHeight.constant = iconDimension
        selectedIconWidth.constant = iconDimension
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        let icon = DrawUtility.drawCheckInCircleImage(
            size: CGSize(width: iconDimension, height: iconDimension),
            lineWidth: 2.0,
            fillColor: UIColor(hexString: "#ffb300"),
            checkColor: .white
        )

        iconImageView.image = selected ? icon : nil
    }
    
}
