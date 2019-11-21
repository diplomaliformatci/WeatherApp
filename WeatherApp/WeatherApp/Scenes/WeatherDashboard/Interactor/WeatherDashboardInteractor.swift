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
    
}

extension WeatherDashboardInteractor: WeatherDashboardRemoteDataManagerOutputProtocol {
    
}


