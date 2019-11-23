//
//  SearchResultTableViewCell.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayoutProperties()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setLayoutProperties() {
        backgroundColor = .extraLightGray
    }
    
    
}
