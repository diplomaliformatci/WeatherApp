//
//  WeatherThumbCollectionViewCell.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherThumbCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var thumbImage: UIImageView!
    @IBOutlet private weak var isSelectedView: UIView!
    @IBOutlet private weak var highTempatureLabel: AnimatedLabel!
    @IBOutlet private weak var lowTempatureLabel: AnimatedLabel!
    @IBOutlet private weak var dayLabel: UILabel!
    
    var tempatureType: TempatureType = .Kelvin
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayoutPropeties()
    }
    
    private func setLayoutPropeties() {
        isSelectedView.layer.cornerRadius = isSelectedView.bounds.height / 2
        isSelectedView.layer.masksToBounds = true
    }
    
    func configureCell(model: WeatherDataModel?) {
        setTempatureLabels(model)
        dayLabel.text = model?.time?.convertToDate().convertToWeekday()
        thumbImage.setImage(model?.weather?.first?.icon)
    }
    
    private func setTempatureLabels(_ model: WeatherDataModel?) {
        highTempatureLabel.text = model?.temp?.max?.toInt().toString()
        lowTempatureLabel.text = model?.temp?.min?.toInt().toString()
    }
    
}






