//
//  WeatherDashboardController.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

fileprivate enum FileConstants {
    static let NibName = "WeatherDashboardController"
}

class WeatherDashboardController: UIViewController {
    init() {
        super.init(nibName: FileConstants.NibName, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - View Cycle
extension WeatherDashboardController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
