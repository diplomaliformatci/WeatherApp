//
//  WeatherDashboardPresenter.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

final class WeatherDashboardPresenter: WeatherDashboardPresenterProtocol {
    var view: WeatherDashboardViewProtocol?
    var interactor: WeatherDashboardInteractorInputProtocol?
    var router: WeatherDashboardRouterProtocol?
    
    var dataSource: [WeatherDataModel]?
    
    init(view: WeatherDashboardViewProtocol, interactor: WeatherDashboardInteractorInputProtocol, router: WeatherDashboardRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func routeToSearch(delegate: DashboardDelegate) {
        router?.navigate(to: .routeToDashboard(delegate: delegate))
    }
}


extension WeatherDashboardPresenter: WeatherDashboardInteractorOutputProtocol {
   
    func onError(_ error: String) { } // No use on this project
    
    func retrieveWeatherData(lat: Double, long: Double) {
        interactor?.retrieveWeatherData(lat: lat, long: long)
    }
    
    func didRetrieveWeatherData(result: OpenWeatherResponse) {
        view?.hideLoading()
        
        dataSource = result.list?.compactMap {
            let model = WeatherDataModel(time: $0.dt, temp: $0.temp, pressure: $0.pressure, weather: $0.weather)
            if model.dayIsToday { view?.showMainWeather(weather: model, cityName: result.city?.name) }
            return model
        }
        
        guard let dataSource = dataSource else {
            view?.showError("No Data to Show")
            return
        }
        
        view?.showWeatherData(weatherData: dataSource)
    
    }
    
    func convertTempature(to type: TempatureType) {
        guard let dataSource = dataSource else { return }
        dataSource.forEach{
            $0.convertTempature(to: type)
            if $0.dayIsToday { view?.showMainWeather(weather: $0, cityName: nil) }
        }
        view?.showWeatherData(weatherData: dataSource)
    }
    
}
