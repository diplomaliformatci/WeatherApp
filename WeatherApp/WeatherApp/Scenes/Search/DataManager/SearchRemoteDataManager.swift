//
//  SearchRemoteDataManager.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

final class SearchRemoteDataManager: SearchRemoteDataManagerInputProtocol {
    
    
    var remoteRequestHandler: SearchRemoteDataManagerOutputProtocol?
    
    var networkProvider: Networkable
    
    init(networkProvider: Networkable) {
        self.networkProvider = networkProvider
    }
    
    func retrievePlaces(by text: String) {
        networkProvider.autoComplete(input: text) { (response) in
            switch response?.status {
            case "OK":
                self.remoteRequestHandler?.didRetrievePlaces(placesResult: response)
            default:
                break
            }
        }
    }
}

