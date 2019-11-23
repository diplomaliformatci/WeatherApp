//
//  GPAutoCompleteResponse.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation
struct GPAutoCompleteResponse: Codable {
    let predictions: [Predictions]?
    let status: String?
}
