//
//  WeatherDataSource.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

class WeatherDataSource: NSObject, UICollectionViewDataSource {


    var dataArray: [WeatherDataModel]
    
    init(dataArray: [WeatherDataModel]) {
        self.dataArray = dataArray
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = dataArray[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherThumbCollectionViewCell", for: indexPath) as? WeatherThumbCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(model: model)
        
        return cell
        
    }


}
