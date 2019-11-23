//
//  GeneralTableViewDataSource.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

class GeneralTableViewDataSource<T>: NSObject, UITableViewDataSource {
    
    typealias ConfigureCell = (T, UITableViewCell) -> Void
    
    var dataArr: [T]
    
    private let reuseIdentifier: String
    private let configureCell: ConfigureCell
    
    init(dataArr: [T], reuseIdentifier: String, configureCell: @escaping ConfigureCell) {
        self.dataArr = dataArr
        self.reuseIdentifier = reuseIdentifier
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        configureCell(model, cell)
        
        return cell
    }
    
    
}
