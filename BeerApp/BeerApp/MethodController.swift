//
//  MethodController.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 17..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class MethodController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailView {
    private var beer: Beer?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func load(data: Beer) {
        self.beer = data
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return (beer?.method.mash_temp.count)!
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "MashTemp"
        }
        if section == 1 {
            return "Fermentation"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
            let tempName = beer?.method.mash_temp[indexPath.row]
            cell.temp.text = "\((tempName?.temp.value)!)" + (tempName?.temp.unit)!
            cell.duration.text = "\(tempName?.duration ?? 0.0)"
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomFre", for: indexPath) as! CustomFre
            let tempName = beer?.method.fermentation
            cell.tempFre.text = "\((tempName?.temp.value)!)" + (tempName?.temp.unit)!
            cell.twist.text = tempName?.twist ?? "😘"
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0
    }
}
