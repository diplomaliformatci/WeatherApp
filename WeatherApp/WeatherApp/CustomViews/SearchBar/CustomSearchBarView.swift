//
//  CustomSearchBarView.swift
//  WeatherApp
//
//  Created by Can Kincal on 22.11.2019.
//  Copyright © 2019 Can Kincal. All rights reserved.
//

import UIKit

protocol CustomViewInitializeProtocol {
    var nibName: String { get }
}

protocol SearchBarDelegate: class {
    func searchBar(_ textField: UITextField, text didChange: String)
}

extension CustomViewInitializeProtocol where Self: UIView  {
    
    // MARK: - Properties
    var nibName: String {
        return String(describing: Self.self)
    }
    
}

class CustomSearchBarView: UIView {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var contentView: UIView!
    
    weak var delegate: SearchBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setLayoutProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setLayoutProperties()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

extension CustomSearchBarView: CustomViewInitializeProtocol {  }

// MARK: - Layout
extension CustomSearchBarView {
    private func setLayoutProperties() {
        textField.addLeftView(width: 24, horizontalPadding: 24, iconImage: UIImage(named: AssetManager.searchIcon))
    }
}

// MARK: - TextField
extension CustomSearchBarView: UITextFieldDelegate {
}


