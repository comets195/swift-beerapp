//
//  AppDelegate.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 17..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var encodedData: Data!
    private let userDefaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if userDefaults.object(forKey: "encodedData") != nil {
            let data = userDefaults.data(forKey: "encodedData")!
            let loadedBeerData = try? PropertyListDecoder().decode(BeerData.self, from: data)
            BeerData.load(instance: loadedBeerData!)
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        encodedData = try? PropertyListEncoder().encode(BeerData.sharedInstance)
        userDefaults.set(encodedData, forKey: "encodedData")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
}

