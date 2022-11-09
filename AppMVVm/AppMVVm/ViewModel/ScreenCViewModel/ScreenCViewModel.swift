//
//  ScreenCViewModel.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import Foundation

class ScreenCViewModel {
    
    private(set) var dataTitle: String? = "Screen C"
    
    var didTapScreen: (() -> Void)?
}
