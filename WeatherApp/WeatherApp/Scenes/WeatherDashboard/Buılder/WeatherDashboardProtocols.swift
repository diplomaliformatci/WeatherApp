//
//  WeatherDashboardProtocols.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation


internal protocol WeatherDashboardViewProtocol: class {
    var presenter: WeatherDashboardPresenterProtocol? { get set }
    
    // Presenter -> View
    func showError(_ error: String)
    func showLoading()
    func hideLoading()
}

internal protocol WeatherDashboardPresenterProtocol: class {
    var view: WeatherDashboardViewProtocol? { get set }
    var interactor: WeatherDashboardInteractorInputProtocol? { get set }
    var router: WeatherDashboardRouterProtocol? { get set }
    
    // View -> Presenter
    func dismissPage()
}

internal protocol WeatherDashboardInteractorOutputProtocol: class {
    // DataManager -> Interactor
    func onError(_ error: String)
}

internal protocol WeatherDashboardInteractorInputProtocol: class {
    var presenter: WeatherDashboardInteractorOutputProtocol? { get set }
    var remoteDataManager: WeatherDashboardRemoteDataManagerInputProtocol? { get set }
    // Interactor -> DataManager
    func retrieveWeatherData()
}

internal protocol WeatherDashboardRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: WeatherDashboardRemoteDataManagerOutputProtocol? { get set }
    // DataManager -> Interactor
    func retrieveWaatherData()
}

internal protocol WeatherDashboardRemoteDataManagerOutputProtocol: class {
    // DataManager -> API Call
//    func onWeatherDataRetrieved(_ data: WarehouseResponse?)
    func onError(_ error: String)
}

internal enum WeatherDashboardRoute {
    case dismissPage
}

internal protocol WeatherDashboardRouterProtocol: class {
    func navigate(to route: WeatherDashboardRoute)
}
