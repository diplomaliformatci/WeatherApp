//
//  ExtUIImage.swift
//  WeatherApp
//
//  Created by Can Kincal on 22.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

extension UIImage {
    func wrappedImageContent(bounds: CGRect) -> UIImageView {
        let imageView = UIImageView(frame: bounds)
        imageView.image = self
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}
