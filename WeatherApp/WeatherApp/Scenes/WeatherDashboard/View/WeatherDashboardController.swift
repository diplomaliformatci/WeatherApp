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
    static let WeatherThumbCellReuseIdentifier = "WeatherThumbCollectionViewCell"
}

class WeatherDashboardController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var weatherView: WeatherView!
    @IBOutlet weak var converterButton: TempatureConverterButton!
    
    var dataSource: UICollectionViewDataSource? {
        willSet {
            collectionView.dataSource = newValue
        }
    }
    
    // MARK: - Delegates
    var presenter: WeatherDashboardPresenterProtocol?

    
    init() {
        super.init(nibName: FileConstants.NibName, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setObservers() {
        searchButton.addTarget(self, action: #selector(routeToSearch), for: .touchUpInside)
    }
    
    private func registerNibs() {
        collectionView.register(UINib(nibName: FileConstants.WeatherThumbCellReuseIdentifier, bundle: Bundle(for: type(of: self))), forCellWithReuseIdentifier: FileConstants.WeatherThumbCellReuseIdentifier)
    }
}

// MARK: - View Cycle
extension WeatherDashboardController {
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setObservers()
        appLaunchRoute()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - Last User State When app launched
extension WeatherDashboardController {
    private func appLaunchRoute() {
        let location = UserDefaultsManager.shared.getLastChoosedLocation()
        guard let lat = location.lat, let lon = location.lon else {
            presenter?.routeToSearch(delegate: self)
            return
        }
        presenter?.retrieveWeatherData(lat: lat, long: lon)
    }
    
}

// MARK: - Search Delegate
extension WeatherDashboardController: DashboardDelegate {
    func userDidChooseLocation(lat: Double?, long: Double?) {
        guard let lat = lat, let long = long else{ return }
        presenter?.retrieveWeatherData(lat: lat, long:  long)
    }
}

// MARK: - Network
extension WeatherDashboardController: WeatherDashboardViewProtocol {
    
    func showWeatherData(weatherData: [WeatherDataModel]) {
        let dataSource = WeatherDataSource(dataArray: weatherData)
        self.dataSource = dataSource
        collectionView.reloadData()
    }
    
    func showMainWeather(weather: WeatherDataModel, cityName: String?) {
        weatherView?.updateLayout(weatherData: weather, cityName: cityName)
    }
    
    func showError(_ error: String) { }
    
    func showLoading() { }
    
    func hideLoading() { }
    
}


extension WeatherDashboardController {
   @IBAction func routeToSearch() {
        presenter?.routeToSearch(delegate: self)
    }
    
    @IBAction func convertButtonTapped(_ sender: Any) {
        presenter?.convertTempature(to: converterButton.changeTempatureType())
    }
    
}
