//
//  ExtUITextField.swift
//  WeatherApp
//
//  Created by Can Kincal on 22.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

extension UITextField {
    func addLeftView(width: CGFloat, horizontalPadding: CGFloat = 0, iconImage: UIImage? = nil) {
        let leftView: UIView = UIView(frame: CGRect(x: horizontalPadding, y: self.bounds.origin.y, width: width + horizontalPadding, height: width))
        self.leftView = leftView
        self.leftViewMode = .always
        if let iconImage = iconImage { leftView.addSubview(iconImage.wrappedImageContent(bounds: leftView.bounds)) }
    }
}
