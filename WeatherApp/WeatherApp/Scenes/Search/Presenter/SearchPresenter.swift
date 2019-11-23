//
//  SearchPresenter.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation


final class SearchPresenter: SearchPresenterProtocol {
    
    var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func dismissPage() {
        
    }
}


extension SearchPresenter: SearchInteractorOutputProtocol {
    
    func onError(_ error: String) { }
    
    func didRetrievePlaces(placesResult: [Predictions]) {
        view?.hideLoading()
        view?.showPlaces(places: placesResult)
    }
    
    func retrievePlaces(by text: String) {
        interactor?.retrievePlaces(by: text)
    }
    
}
