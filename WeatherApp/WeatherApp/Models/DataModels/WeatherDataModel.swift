//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Can Kincal on 24.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

enum TempatureType: String {
    case Kelvin = "K"
    case Celsius = "C"
}

class WeatherDataModel {
    let time: Double?
    var temp: Temp?
    let pressure: Double?
    let weather: [Weather]?
    var tempatureType: TempatureType? = .Kelvin
    
    init(time: Double?, temp: Temp?, pressure: Double?, weather: [Weather]?) {
        self.time = time
        self.temp = temp
        self.pressure = pressure
        self.weather = weather
    }
    
    var dayIsToday: Bool {
        guard let timeStamp = time  else { return false }
        return timeStamp.convertToDate().isDateInToday()
    }
    
    func convertTempature(to type: TempatureType) {
        temp?.convertTempature(to: type)
        tempatureType = type
    }
}
