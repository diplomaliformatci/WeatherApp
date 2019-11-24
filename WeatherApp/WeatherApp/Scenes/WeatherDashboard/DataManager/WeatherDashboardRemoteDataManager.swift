//
//  WeatherDashboardRemoteDataManager.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

final class WeatherDashboardRemoteDataManager: WeatherDashboardRemoteDataManagerInputProtocol {

    var remoteRequestHandler: WeatherDashboardRemoteDataManagerOutputProtocol?
    
    var networkProvider: Networkable
    
    init(networkProvider: Networkable) {
        self.networkProvider = networkProvider
    }
    
    func retrieveWeatherData(lat: Double, long: Double) {
        networkProvider.openWeatherByGeoLocation(lat: lat, long: long, completion: { result in
            switch result {
            case .none:
                self.remoteRequestHandler?.onError("")
            case .some(_):
                self.remoteRequestHandler?.didRetrieveWeatherData(result)
            }
        })
    }
}
