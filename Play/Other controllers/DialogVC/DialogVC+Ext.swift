//
//  DialogVC+Ext.swift
//  Play
//
//  Created by kevin chiang on 2020/3/17.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

extension DialogVC: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DialogTableViewCell.reuseIdentifier, for: indexPath) as! DialogTableViewCell
        
        cell.label.textColor = optionTxtColor
        
        let option = options[indexPath.row]
        if option is String {
            cell.label.text = option as? String
        } else if option is Int || option is Double {
            cell.label.text = "\(option)"
        } else {
            cell.label.text = "[Unknown Type]"
        }
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelectOption?(options[indexPath.row])
    }

}
