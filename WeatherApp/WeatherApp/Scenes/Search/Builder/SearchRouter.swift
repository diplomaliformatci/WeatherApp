//
//  SearchRouter.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

internal final class SearchRouter: SearchRouterProtocol {
    
    unowned let view: SearchViewController
    
    init(view: SearchViewController) {
        self.view = view
    }
    
    func navigate(to route: SearchRoute) {
        switch route {
        case .dismissPage:
            break
        }
    }
    
}
