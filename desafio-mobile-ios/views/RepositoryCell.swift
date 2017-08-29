//
//  TableViewCell.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoForks: UILabel!
    @IBOutlet weak var repoStars: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
