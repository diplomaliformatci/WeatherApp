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
    
    init(view: WeatherDashboardViewProtocol, interactor: WeatherDashboardInteractorInputProtocol, router: WeatherDashboardRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func dismissPage() {
        
    }
}


extension WeatherDashboardPresenter: WeatherDashboardInteractorOutputProtocol {
   
    func onError(_ error: String) {
        
    }
    
}
