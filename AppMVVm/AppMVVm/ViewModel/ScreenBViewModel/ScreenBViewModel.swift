//
//  ScreenBViewModel.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import Foundation

class ScreenBViewModel {
    
    private(set) var dataTitle: String? = "Screen B"
    
    var didTapScreen: (() -> Void)?
}
