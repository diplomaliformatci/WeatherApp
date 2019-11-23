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
    
    var placesDataArr: [Predictions]?
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func dismissPage() {
        router?.navigate(to: .dismissPage)
    }
}


extension SearchPresenter: SearchInteractorOutputProtocol {
    
    func onError(_ error: String) { }
    
    func didRetrievePlaces(placesResult: [Predictions]) {
        view?.hideLoading()
        
        self.placesDataArr = placesResult
        
        view?.showPlaces(places: placesResult)
    }
    
    func didRetrieveSelectedPlaceDetails(placeDetailsResult: GPGeometry?) {
        view?.hideLoading()
        guard let geometry = placeDetailsResult else {
            view?.showError("No geometry data found")
            return
        }
        view?.showPlaceDetails(details: geometry)
    }
    
    func retrievePlaces(by text: String) {
        interactor?.retrievePlaces(by: text)
    }
    
    func retrieveSelectedPlaceDetails(with indexPath: IndexPath) {
        guard let places = placesDataArr,
              let id = places[indexPath.row].place_id else { return }
        
        interactor?.retrieveSelectedPlaceDetails(with: id)
        
    }
    
    func clearTableView() {
        view?.showPlaces(places: [])
    }
    
}
