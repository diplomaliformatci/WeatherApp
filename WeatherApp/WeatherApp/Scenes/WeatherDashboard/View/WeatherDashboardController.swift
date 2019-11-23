//
//  WeatherDashboardController.swift
//  WeatherApp
//
//  Created by Can Kincal on 21.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit
import Moya

fileprivate struct FileConstants {
    static let NibName = "WeatherDashboardController"
}

class WeatherDashboardController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: CustomSearchBarView!
    
    // MARK: - Delegates
    var presenter: WeatherDashboardPresenterProtocol?
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        routeToSearch()
    }
}

extension WeatherDashboardController: DashboardDelegate {
    func userDidChooseLocation(lat: Double?, long: Double?) {
        print("LATITDE: ",lat)
        print("LONGITUDE: ",long)
    }
}

// MARK: - View Protocol
extension WeatherDashboardController: WeatherDashboardViewProtocol {
    
    func showError(_ error: String) { }
    
    func showLoading() { }
    
    func hideLoading() { }
    
}


extension WeatherDashboardController {
    func routeToSearch() {
        presenter?.routeToSearch(delegate: self)
    }
}
