//
//  BrewTipsControllerViewController.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 17..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class BrewTipsController: UIViewController, DetailView {
    @IBOutlet weak var tips: UITextView!
    private var beer: Beer?
    
    func load(data: Beer) {
        self.beer = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tips.text = beer?.brewers_tips
    }
    
}
