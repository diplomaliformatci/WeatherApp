//
//  WeatherDashboardBuilder.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

final class WeatherDashboardBuilder {
    
    class func build() -> WeatherDashboardController {
    
        let controller = WeatherDashboardController()
        
        let router: WeatherDashboardRouterProtocol = WeatherDashboardRouter(view: controller)
        let interactor: WeatherDashboardInteractorInputProtocol & WeatherDashboardRemoteDataManagerOutputProtocol = WeatherDashboardInteractor()
        let presenter: WeatherDashboardPresenterProtocol & WeatherDashboardInteractorOutputProtocol = WeatherDashboardPresenter(view: controller, interactor: interactor, router: router)
        let remoteDataManager: WeatherDashboardRemoteDataManagerInputProtocol = WeatherDashboardRemoteDataManager()
        
        
        controller.presenter = presenter
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return controller
        
    }
    
}
