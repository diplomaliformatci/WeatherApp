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
    
    var provider = MoyaProvider<GooglePlacesAPI>(plugins: [NetworkLoggerPlugin(verbose: true, cURL: true)])

    func autoComplete<T: Codable>(input: String, completion: @escaping (T?) -> ()) {
        provider.request(.autoComplete(input: input)) { result in
            switch result {
            case let .success(response):
                completion(try? JSONDecoder().decode(T.self, from: response.data))
            case .failure(_):
                fatalError("Network failure")
            }
        }
    }
    
}
