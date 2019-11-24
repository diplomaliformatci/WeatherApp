//
//  OpenWeatherEndpointManager.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation
import Moya
//http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=14588a978135a26e0cb964d1f40444bd



enum OpenWeatherAPI {
    case weatherInformation(lat: Double, long: Double)
}

extension OpenWeatherAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast/") else { fatalError("Url cannot be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .weatherInformation:
            return "daily"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .weatherInformation:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .weatherInformation(let lat, let long):
            return .requestParameters(parameters: ["lat": lat,
                                                   "lon": long,
                                                   "appid": weatherApiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .weatherInformation:
            return [Headers.contentType: Headers.ContentType.json]
        }
    }
}
