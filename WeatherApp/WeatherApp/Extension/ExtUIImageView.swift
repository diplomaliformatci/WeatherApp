//
//  ExtUIImageView.swift
//  WeatherApp
//
//  Created by Can Kincal on 24.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import Kingfisher

extension UIImageView {
    func setImage(_ urlPath: String?) {
        guard let urlPath = urlPath else { return }
        let url = URL(string: "http://openweathermap.org/img/wn/\(urlPath)@2x.png")
        self.kf.setImage(with: url)
    }
}
