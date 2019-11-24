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
    func searchBar(_ searchBar: CustomSearchBarView, didChange text: String)
    func searchBar(_ serchBar: CustomSearchBarView, didClear text: Bool)
}

extension CustomViewInitializeProtocol where Self: UIView  {
    
    // MARK: - Properties
    var nibName: String {
        return String(describing: Self.self)
    }
    
}

class CustomSearchBarView: UIView, CustomViewInitializeProtocol {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private var contentView: UIView!
    
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
        setDelegates()
        setObservers()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}


// MARK: - Layout
extension CustomSearchBarView {
    private func setLayoutProperties() {
        textField.addLeftView(width: 24, horizontalPadding: 24, iconImage: UIImage(named: AssetManager.searchIcon))
    }
    
    private func setDelegates() {
        textField.delegate = self
    }
    
    private func setObservers() {
        textField.addTarget(self, action: #selector(textFieldValueChanged), for: UIControl.Event.editingChanged)
    }
    
}

// MARK: - TextField
extension CustomSearchBarView: UITextFieldDelegate {
    
    @IBAction func textFieldValueChanged() {
        guard let text = textField.text else {
            return
        }
        
        text.isEmpty ? delegate?.searchBar(self, didClear: true) : delegate?.searchBar(self, didChange: text)
    }
    
}


