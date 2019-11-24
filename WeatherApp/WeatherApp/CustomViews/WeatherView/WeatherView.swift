//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Can Kincal on 23.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

class WeatherView: UIView, CustomViewInitializeProtocol {
    
    // MARK: - Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var cityNameLabel: AnimatedLabel!
    @IBOutlet private weak var highTempatureLabel: AnimatedLabel!
    @IBOutlet private weak var lowTempatureLabel: AnimatedLabel!
    @IBOutlet private weak var weatherImage: UIImageView!
    @IBOutlet private weak var weatherStatusLabel: AnimatedLabel!
    @IBOutlet private weak var weatherDescriptionLabel: AnimatedLabel!
    
    @IBOutlet weak var thumbView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

extension WeatherView {
    func updateLayout(weatherData: WeatherDataModel?, cityName: String? = nil) {
        setCityName(cityName)
        weatherImage.setImage(weatherData?.weather?.first?.icon)
        highTempatureLabel.text = weatherData?.temp?.max?.toInt().toString()
        lowTempatureLabel.text = weatherData?.temp?.max?.toInt().toString()
        weatherDescriptionLabel.text = weatherData?.weather?.first?.description
        weatherStatusLabel.text = weatherData?.weather?.first?.main
    }
    
    private func setCityName(_ name: String?) {
        guard let name = name else { return }
        cityNameLabel.text = name
    }
    
}
