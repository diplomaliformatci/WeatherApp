//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation
import Moya

struct NetworkManager: Networkable {
    
    var provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(verbose: true, cURL: false)])
    
    func autoComplete(input: String, completion: @escaping (GPAutoCompleteResponse?) -> ()) {
        provider.request(MultiTarget(GooglePlacesAPI.autoComplete(input: input))) { result in
            switch result {
            case let .success(response):
                completion(try? JSONDecoder().decode(GPAutoCompleteResponse.self, from: response.data))
            case .failure(_):
                fatalError("Network Error")
            }
        }
    }
    
    func placeDetails(placeId: String, completion: @escaping (GPPlaceDetailsResponse?) -> ()) {
        provider.request(MultiTarget(GooglePlacesAPI.placeDetails(placeId: placeId))) { result in
            switch result {
            case let .success(response):
                completion(try? JSONDecoder().decode(GPPlaceDetailsResponse.self, from: response.data))
            case .failure(_):
                fatalError("Network Error")
            }
        }
    }
    
    func openWeatherByGeoLocation(lat: Double, long: Double, completion: @escaping (OpenWeatherResponse?) -> ()) {
        provider.request(MultiTarget(OpenWeatherAPI.weatherInformation(lat: lat, long: long))) { result in
            switch result {
            case let .success(response):
                completion(try? JSONDecoder().decode(OpenWeatherResponse.self, from: response.data))
            case .failure(_):
                fatalError("Network Error")
            }
        }
    }
}
