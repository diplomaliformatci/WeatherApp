//
//  SearchInteractor.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

final class SearchInteractor {
    var presenter: SearchInteractorOutputProtocol?
    var remoteDataManager: SearchRemoteDataManagerInputProtocol?
    
    
}

extension SearchInteractor:  SearchInteractorInputProtocol {
    func retrievePlaces(by text: String) {
        remoteDataManager?.retrievePlaces(by: text)
    }
    
    func retrieveSelectedPlaceDetails(with id: String) {
        remoteDataManager?.retrieveSelectedPlaceDetails(with: id)
    }
    
    func onError(_ error: String) {
        
    }
    
}

extension SearchInteractor: SearchRemoteDataManagerOutputProtocol {
    func didRetrieveSelectedPlaceDetails(response: GPPlaceDetailsResponse?) {
        guard let result = response?.result else {
            presenter?.onError("No data Found")
            return
        }
        presenter?.didRetrieveSelectedPlaceDetails(placeDetailsResult: result.geometry)
    }
    
    func didRetrievePlaces(placesResult: GPAutoCompleteResponse?) {
        guard let predictions = placesResult?.predictions else {
            presenter?.onError("No Data Found")
            return
        }
        
        presenter?.didRetrievePlaces(placesResult: predictions)
    }
    
}


