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
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DialogTableViewCell.reuseIdentifier, for: indexPath) as! DialogTableViewCell
        
        cell.label.textColor = optionTxtColor
        cell.label.text = actions[indexPath.row].title
        
        cell.separatorInset.left = (indexPath.row == actions.count - 1) ? CGFloat.infinity : 0
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        action.handler?(action)
        
        if action.shallDismissDialog {
            delegate?.dismissDialogViewController(.fadeInOut)
        }
    }

}
