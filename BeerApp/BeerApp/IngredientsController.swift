//
//  IngredientsController.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 17..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class IngredientsController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailView {
    @IBOutlet weak var tableView: UITableView!
    private var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func load(data: Beer) {
        self.beer = data
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return (beer?.ingredients.malt.count)!
        case 1:
            return (beer?.ingredients.malt.count)!
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Malt"
        }
        if section == 1 {
            return "Hops"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            let maltCell = tableView.dequeueReusableCell(withIdentifier: "MaltCell", for: indexPath) as! MaltCell
            let malt = beer?.ingredients.malt[indexPath.row]
            maltCell.name.text = malt?.name
            maltCell.amount.text = "\((malt?.amount.value)!)" + (malt?.amount.unit)!
            cell = maltCell
        }
        
        if indexPath.section == 1 && (beer?.ingredients.hops.count)! > indexPath.row {
            let hopsCell = tableView.dequeueReusableCell(withIdentifier: "HopsCell", for: indexPath) as! HopsCell
            let hops = beer?.ingredients.hops[indexPath.row]
            hopsCell.name.text = hops?.name
            hopsCell.amount.text = "\((hops?.amount.value)!)" + (hops?.amount.unit)!
            cell = hopsCell
        }
        
        if indexPath.section == 2 {
            let yeastCell = tableView.dequeueReusableCell(withIdentifier: "YeastCell", for: indexPath) as! YeastCell
            yeastCell.yeast.text = beer?.ingredients.yeast
            cell = yeastCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.section == 0 {
            return 90
        } else if indexPath.section == 2 {
            return 80
        } else {
            return 150
        }
    }
}
//&& (beer?.ingredients.hops.count)! > indexPath.row
