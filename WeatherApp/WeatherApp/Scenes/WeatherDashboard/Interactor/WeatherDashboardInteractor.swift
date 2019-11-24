//
//  WeatherDashboardInteractor.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

final class WeatherDashboardInteractor {
    var presenter: WeatherDashboardInteractorOutputProtocol?
    var remoteDataManager: WeatherDashboardRemoteDataManagerInputProtocol?
    
    
    func retrieveWeatherData() {
        
    }
    
}

extension WeatherDashboardInteractor:  WeatherDashboardInteractorInputProtocol {
    func onError(_ error: String) {
        
    }
    
    func retrieveWeatherData(lat: Double, long: Double) {
        remoteDataManager?.retrieveWeatherData(lat: lat, long: long)
    }
    
}

extension WeatherDashboardInteractor: WeatherDashboardRemoteDataManagerOutputProtocol {
    
    func didRetrieveWeatherData(_ data: OpenWeatherResponse?) {
        guard let data = data else {
            presenter?.onError("No Data Found")
            return
        }
        presenter?.didRetrieveWeatherData(result: data)
    }
    
}


