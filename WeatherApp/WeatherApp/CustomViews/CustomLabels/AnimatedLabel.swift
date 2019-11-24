//
//  AnimatedLabel.swift
//  WeatherApp
//
//  Created by Can Kincal on 24.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

class AnimatedLabel: UILabel {
    
    override var text: String? {
        didSet {
            animateLabel()
        }
    }
    
    private func animateLabel() {
        self.fadeTransition(1.0)
    }
    
}
