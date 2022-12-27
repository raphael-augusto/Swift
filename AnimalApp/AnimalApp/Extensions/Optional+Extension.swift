//
//  Optional+Extension.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 24/12/22.
//

import Foundation


extension Optional where Wrapped == String {
    
    var orEmpty: String {
        self ?? ""
    }
    
    var isNilOrEmpety: Bool {
        self == nil || self == ""
    }
}
