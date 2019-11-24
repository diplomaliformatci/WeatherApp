//
//  TempatureConverterButton.swift
//  WeatherApp
//
//  Created by Can Kincal on 24.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

class TempatureConverterButton: UIButton {
    
    var converterType: TempatureType = .Kelvin {
        willSet {
            self.setTitle(newValue.rawValue, for: .normal)
        }
    }
    
    @discardableResult
    func changeTempatureType() -> TempatureType {
        switch converterType {
        case .Celsius:
            converterType = .Kelvin
        case .Kelvin:
            converterType = .Celsius
        }
        
        return converterType
    }
    
}
