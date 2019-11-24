//
//  ExtDouble.swift
//  WeatherApp
//
//  Created by Can Kincal on 24.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

extension Double {
    func convertToDate() -> Date {
        return Date(timeIntervalSince1970: self)
    }
    
    func toInt() -> Int {
        return Int(self)
    }
}

extension Double {
    mutating func temperatureInKelvin() {
        self = self + 273.15
    }
    mutating func temperatureInCelcius() {
        self = self - 273.15
    }
}
