//
//  DetailViewController.swift
//  desafio-mobile-ios
//
//  Created by Josué on 26/08/17.
//  Copyright © 2017 Josué. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pullCell", for: indexPath)
        return cell
    }

}
