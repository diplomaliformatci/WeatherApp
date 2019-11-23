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
    
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    var dataSource: UITableViewDataSource? {
        willSet {
            searchResultsTableView.dataSource = newValue
        }
    }
    
    // MARK: - Delegates
    weak var dashboardDelegate: DashboardDelegate?
    var presenter: SearchPresenterProtocol?
    
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
    
}

// MARK: - ViewCycle
extension SearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dashboardDelegate?.temp()
        presenter?.retrievePlaces(by: "istanbul")
    }
}


extension SearchViewController: SearchViewProtocol {
    
    func showPlaces(places: [Predictions]) {
        let dataSource = GeneralTableViewDataSource(dataArr: places,
                                                    reuseIdentifier: "SearchResultTableViewCell") { place, cell in
            cell.textLabel?.text = place.description
        }
        self.dataSource = dataSource
        searchResultsTableView.reloadData()
    }
    
    func showError(_ error: String) { }
    
    func showLoading() { }
    
    func hideLoading() { }
    
}
