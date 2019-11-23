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
    
    func onError(_ error: String) {
        
    }
    
}

extension SearchInteractor: SearchRemoteDataManagerOutputProtocol {
    func didRetrievePlaces(placesResult: GPAutoCompleteResponse?) {
        guard let predictions = placesResult?.predictions else {
            presenter?.onError("No Data Found")
            return
        }
        
        presenter?.didRetrievePlaces(placesResult: predictions)
    }
    
}


