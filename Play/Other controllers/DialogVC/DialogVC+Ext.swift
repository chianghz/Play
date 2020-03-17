//
//  DialogVC+Ext.swift
//  Play
//
//  Created by kevin chiang on 2020/3/17.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

extension DialogVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DialogTableViewCell.reuseIdentifier, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

}
