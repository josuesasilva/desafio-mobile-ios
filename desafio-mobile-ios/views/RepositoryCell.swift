//
//  TableViewCell.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoForks: UILabel!
    @IBOutlet weak var repoStars: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    var repository: Repository?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setValue(repository: Repository) {
        self.repository = repository
        self.repoName.text = repository.name
        self.repoDescription.text = repository.description
        self.repoForks.text = String(describing: repository.forks!)
        self.repoStars.text = String(describing: repository.stars!)
        self.userName.text = repository.owner?.name
        self.userFullName.text = ""
        self.avatar.kf.setImage(with: URL(string: (repository.owner?.avatar)!))
    }
    
}
