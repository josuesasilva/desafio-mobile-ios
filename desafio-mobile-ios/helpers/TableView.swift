//
//  TableView.swift
//  desafio-mobile-ios
//
//  Created by Josué on 30/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit

class TableView: NSObject {
    
    static let startLoadingOffset: CGFloat = 20.0

    static func isNearTheBottomEdge(contentOffset: CGPoint, _ tableView: UITableView) -> Bool {
        return contentOffset.y + tableView.frame.size.height + startLoadingOffset > tableView.contentSize.height && contentOffset.y > 0
    }
    
}
