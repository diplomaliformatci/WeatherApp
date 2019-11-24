//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

fileprivate struct FileConstants {
    static let NibName = "SearchViewController"
}

class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var searchResultsTableView: UITableView!
    @IBOutlet private weak var searchBar: CustomSearchBarView!

    // MARK: - Properties
    var dataSource: UITableViewDataSource? {
        willSet {
            searchResultsTableView.dataSource = newValue
        }
    }
    
    // MARK: - Delegates
    weak var dashboardDelegate: DashboardDelegate?
    var presenter: SearchPresenterProtocol?
    
    
    // MARK: - Initilization
    init(delegate dashboardDelegate: DashboardDelegate) {
        super.init(nibName: FileConstants.NibName, bundle: Bundle(for: type(of: self)))
        self.dashboardDelegate = dashboardDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func registerNibs() {
        searchResultsTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: Bundle(for: type(of: self))), forCellReuseIdentifier: "SearchResultTableViewCell")
    }
    
    private func setDelegates() {
        searchResultsTableView.delegate = self
        searchBar.delegate = self
    }

}

// MARK: - Layout
extension SearchViewController {
    private func setLayoutProperties() {
        searchResultsTableView.separatorStyle = .none
    }
}

// MARK: - ViewCycle
extension SearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLayoutProperties()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}


// MARK: - Tableview Delegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.retrieveSelectedPlaceDetails(with: indexPath)
    }
    
    private func reloadData(dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
        DispatchQueue.main.async {
            self.searchResultsTableView.reloadData()
        }
    }
}

// MARK: - Searchbar Delegate
extension SearchViewController: SearchBarDelegate {
    func searchBar(_ serchBar: CustomSearchBarView, didClear text: Bool) {
        presenter?.clearTableView()
    }
    
    func searchBar(_ searchBar: CustomSearchBarView, didChange text: String) {
        presenter?.retrievePlaces(by: text)
    }
}


// MARK: - Network
extension SearchViewController: SearchViewProtocol {
    func showPlaces(places: [Predictions]) {
        let dataSource = GeneralTableViewDataSource(dataArr: places,
                                                    reuseIdentifier: "SearchResultTableViewCell") { place, cell in
            cell.textLabel?.text = place.description
        }
        
        reloadData(dataSource: dataSource)
    }
    
    func showPlaceDetails(details: GPGeometry) {
        dashboardDelegate?.userDidChooseLocation(lat: details.location?.lat, long: details.location?.lng)
        UserDefaultsManager.shared.setLastChoosedLocation((lat: details.location?.lat, lon: details.location?.lng))
        presenter?.dismissPage()
    }
    
    func showError(_ error: String) { }
    
    func showLoading() {}
    
    func hideLoading() {}
    
}

