//
//  DialogAction.swift
//  Play
//
//  Created by kevin chiang on 2020/3/18.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//

import UIKit

public struct DialogAction {
    
    let title: String?
    let handler: ((DialogAction) -> Void)?
    
    /// Set it to *false* if you don't want alert to be dismissed after button is pressed
    public var shallDismissDialog = true
    
    public init(title: String?, shallDismiss: Bool = true, handler: ((DialogAction) -> Void)?) {
        self.title = title
        self.handler = handler
        self.shallDismissDialog = shallDismiss
    }
    
}
