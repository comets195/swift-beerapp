//
//  BeerData.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 17..
//  Copyright © 2018년 Napster. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

class BeerData: Codable {
    var beers = [Beer]()
    
    static var sharedInstance: BeerData = {
        return BeerData()
    }()
    
    static func load(instance: BeerData) {
        self.sharedInstance = instance
    }
}
