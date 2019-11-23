//
//  SearchBuilder.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation
import Moya
final class SearchBuilder {
    
    class func build(delegate: DashboardDelegate) -> SearchViewController {
        
        let controller = SearchViewController(delegate: delegate)
        
        let router: SearchRouterProtocol = SearchRouter(view: controller)
        let interactor: SearchInteractorInputProtocol & SearchRemoteDataManagerOutputProtocol = SearchInteractor()
        let presenter: SearchPresenterProtocol & SearchInteractorOutputProtocol = SearchPresenter(view: controller, interactor: interactor, router: router)
        let remoteDataManager: SearchRemoteDataManagerInputProtocol = SearchRemoteDataManager(networkProvider: NetworkManager(provider: NetworkManager().provider))
        
        
        controller.presenter = presenter
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return controller
        
    }
    
}
