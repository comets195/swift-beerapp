//
//  PairingController.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 18..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class PairingController: UITableViewController, DetailView {
    private var beer: Beer?
    
    func load(data: Beer) {
        self.beer = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (beer?.food_pairing.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = beer?.food_pairing[indexPath.row]
        return cell
    }

}
