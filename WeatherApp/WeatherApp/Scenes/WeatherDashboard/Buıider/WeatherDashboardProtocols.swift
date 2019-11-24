//
//  WeatherDashboardProtocols.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation


internal protocol DashboardDelegate: class {
    func userDidChooseLocation(lat: Double?, long: Double?)
}

internal protocol WeatherDashboardViewProtocol: class {
    var presenter: WeatherDashboardPresenterProtocol? { get set }
    
    // Presenter -> View
    func showWeatherData(weatherData: [WeatherDataModel])
    func showMainWeather(weather: WeatherDataModel, cityName: String?)
    func showError(_ error: String) // No use on this project
    func showLoading() // No use on this project
    func hideLoading() // No use on this project
}

internal protocol WeatherDashboardPresenterProtocol: class {
    var view: WeatherDashboardViewProtocol? { get set }
    var interactor: WeatherDashboardInteractorInputProtocol? { get set }
    var router: WeatherDashboardRouterProtocol? { get set }
    
    // View -> Presenter
    func routeToSearch(delegate: DashboardDelegate)
    
    func convertTempature(to type: TempatureType)
    
    func retrieveWeatherData(lat: Double, long: Double)
    
}

internal protocol WeatherDashboardInteractorOutputProtocol: class {
    // DataManager -> Interactor
    func onError(_ error: String) // No use on this project
    func didRetrieveWeatherData(result: OpenWeatherResponse)
}

internal protocol WeatherDashboardInteractorInputProtocol: class {
    var presenter: WeatherDashboardInteractorOutputProtocol? { get set }
    var remoteDataManager: WeatherDashboardRemoteDataManagerInputProtocol? { get set }
    // Interactor -> DataManager
    func retrieveWeatherData(lat: Double, long: Double)
}

internal protocol WeatherDashboardRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: WeatherDashboardRemoteDataManagerOutputProtocol? { get set }
    // DataManager -> Interactor
    func retrieveWeatherData(lat: Double, long: Double)
}

internal protocol WeatherDashboardRemoteDataManagerOutputProtocol: class {
    // DataManager -> API Call
    func didRetrieveWeatherData(_ data: OpenWeatherResponse?)
    func onError(_ error: String) // No use on this project
}

internal enum WeatherDashboardRoute {
    case dismissPage
    case routeToDashboard(delegate: DashboardDelegate)
}

internal protocol WeatherDashboardRouterProtocol: class {
    func navigate(to route: WeatherDashboardRoute)
}
