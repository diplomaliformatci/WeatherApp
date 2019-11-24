//
//  ExtDate.swift
//  WeatherApp
//
//  Created by Can Kincal on 24.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Foundation

extension Date {
    func isDateInToday() -> Bool {
        return Calendar.current.isDateInToday(self) ? true : false
    }
}

extension Date {
    func convertToWeekday() -> String {
        return DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: self) - 1]
    }
}

