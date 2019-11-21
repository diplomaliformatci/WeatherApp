//
//  WeatherDashboardRouter.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

internal final class WeatherDashboardRouter: WeatherDashboardRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: WeatherDashboardRoute) {
        switch route {
        case .dismissPage:
            break
        }
    }
    
}
