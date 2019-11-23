//
//  GoolgePlacesEndpointManager.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation
import Moya

//https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJN1t_tDeuEmsRUsoyG83frY4&fields=name,geometry&key=AIzaSyC-a8Qohw3xNHlsH9s_4mY1a5w3w40D_QE

//https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJN1t_tDeuEmsRUsoyG83frY4&fields=geometry&key=AIzaSyC-a8Qohw3xNHlsH9s_4mY1a5w3w40D_QE


protocol Networkable {
    var provider: MoyaProvider<GooglePlacesAPI> { get }
    func autoComplete(input: String, completion: @escaping (GPAutoCompleteResponse?) -> ())
    func placeDetails(placeId: String, completion: @escaping (GPPlaceDetailsResponse?) -> ())
}

enum GooglePlacesAPI {
    case autoComplete(input: String)
    case placeDetails(placeId: String)
}

extension GooglePlacesAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/") else { fatalError("Url cannot be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .autoComplete:
            return "autocomplete/json"
        case .placeDetails:
            return "details/json"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .autoComplete:
            return .get
        case .placeDetails:
            return .get
        }
    }
    
    var sampleData: Data {
            return Data()
    }
    
    var task: Task {
        switch self {
        case .autoComplete(let input):
            return .requestParameters(parameters: ["input": input,
                "key": GPApiKey], encoding: URLEncoding.queryString)
        case .placeDetails(let placeId):
            return .requestParameters(parameters: ["place_id": placeId,
                                                   "fields" : "geometry,name",
                                                   "key": GPApiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .autoComplete:
            return [Headers.contentType: Headers.ContentType.json]
        case .placeDetails:
            return [Headers.contentType: Headers.ContentType.json]
        }
    }
    
    
    
    
}


struct Headers {
    static let contentType = "Content-type"
    
    struct ContentType {
        static let json = "application/json"
    }

    
}

