//
//  ConfigurableView.swift
//  AnimalAgeApp
//
//  Created by Raphael Augusto on 23/11/22.
//

import UIKit

public protocol ConfigurableView {
    func initLayout()
    func initView()
    func initSubviews()
    func initConstraints()
    func setupAdditional()
}

public extension ConfigurableView {
    
    func initLayout() {
        initView()
        initSubviews()
        initConstraints()
        setupAdditional()
    }
    
    func setupAdditional() { }
}

//MARK: - UIView extension to add more than one subview
public extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach (addSubview)
    }
}
