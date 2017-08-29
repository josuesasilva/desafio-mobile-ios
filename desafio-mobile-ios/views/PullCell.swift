//
//  PullCell.swift
//  desafio-mobile-ios
//
//  Created by Josué on 28/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit

class PullCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pullDescription: UILabel!
    @IBOutlet weak var avatar: RoundedImageView!
    @IBOutlet weak var username: UILabel!
    
    var pull: Pull?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setValue(pull: Pull) {
        self.pull = pull
        self.name.text = pull.title
        self.pullDescription.text = pull.body
        self.avatar.kf.setImage(with: URL(string: (pull.user?.avatar)!))
        self.username.text = pull.user?.name
    }

}
