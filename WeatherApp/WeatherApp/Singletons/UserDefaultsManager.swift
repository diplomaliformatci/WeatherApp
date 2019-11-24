//
//  UserDefaultsManager.swift
//  WeatherApp
//
//  Created by Can Kincal on 24.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

struct UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    struct NamespaceKeys {
        static let lastChoosedLocation = "last_choosed_location"
    }
    
    func setLastChoosedLocation(_ lastLocation: (lat: Double?, lon: Double?)) {
        let lastLocationArray = [lastLocation.lat, lastLocation.lon]
        UserDefaults.standard.set(lastLocationArray, forKey: NamespaceKeys.lastChoosedLocation)
    }
    
    func getLastChoosedLocation() -> (lat: Double?, lon: Double?) {
        let returnValue = UserDefaults.standard.array(forKey: NamespaceKeys.lastChoosedLocation) as? [Double]
        return (returnValue?.first, returnValue?.last)
    }
    
    
    
}
