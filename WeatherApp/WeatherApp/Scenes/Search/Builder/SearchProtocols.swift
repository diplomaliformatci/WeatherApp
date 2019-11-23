//
//  SearchProtocols.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

internal protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }
    
    // Presenter -> View
    func showPlaces(places: [Predictions])
    func showError(_ error: String)
    func showLoading()
    func hideLoading()
}

internal protocol SearchPresenterProtocol: class {
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
    
    // View -> Presenter
    func dismissPage()
    
    func retrievePlaces(by text: String)
}

internal protocol SearchInteractorOutputProtocol: class {
    // DataManager -> Interactor
    func onError(_ error: String)
    func didRetrievePlaces(placesResult: [Predictions])
}

internal protocol SearchInteractorInputProtocol: class {
    var presenter: SearchInteractorOutputProtocol? { get set }
    var remoteDataManager: SearchRemoteDataManagerInputProtocol? { get set }
    // Interactor -> DataManager
    func retrievePlaces(by text: String)
}

internal protocol SearchRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: SearchRemoteDataManagerOutputProtocol? { get set }
    // DataManager -> Interactor
    func retrievePlaces(by text: String)
    
}

internal protocol SearchRemoteDataManagerOutputProtocol: class {
    // DataManager -> API Call
    func onError(_ error: String)
    func didRetrievePlaces(placesResult: GPAutoCompleteResponse?)
}

internal enum SearchRoute {
    case dismissPage
}

internal protocol SearchRouterProtocol: class {
    func navigate(to route: SearchRoute)
}
