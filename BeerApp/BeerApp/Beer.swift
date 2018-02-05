//
//  Beer.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 17..
//  Copyright © 2018년 Napster. All rights reserved.
//

import Foundation

struct Beer: Codable {
    let name: String
    let tagline: String
    let description: String
    let first_brewed: String
    let abv: Double
    let ibu: Double?
    let target_fg: Double?
    let target_og: Double?
    let ebc: Double?
    let srm: Double?
    let ph: Double?
    let attenuation_level: Double?
    let brewers_tips: String
    let contributed_by: String
    let image_url: String
    let volume: Volume
    let boil_volume: Volume
    let method: Method
    let ingredients: Ingredients
    let food_pairing: [String]
}

struct Volume: Codable {
    let value: Double?
    let unit: String
}

struct Method: Codable {
    let mash_temp: [Temp]
    let fermentation: TempOne
}

struct Temp: Codable {
    let temp: Volume
    let duration: Double?
}

struct TempOne: Codable {
    let temp: Volume
    let twist: String?
}

struct Ingredients: Codable {
    let malt: [Malt]
    let hops: [Hops]
    let yeast: String
}

struct Malt: Codable {
    let name: String
    let amount: Volume
}

struct Hops: Codable {
    let name: String
    let amount: Volume
    let add: String
    let attribute: String
}
