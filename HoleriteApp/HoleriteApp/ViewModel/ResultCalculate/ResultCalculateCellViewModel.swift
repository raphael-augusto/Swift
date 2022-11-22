//
//  ResultCalculateCellViewModel.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 19/11/22.
//

import Foundation

class ResultCalculateCellViewModel {
    
    var objc: Holeritedata
    
    
    init(objc: Holeritedata) {
        self.objc = objc
    }
    
    
    var name: String {
        return self.objc.name ?? "Error"
    }
    
    
    var value: String {
        return self.objc.value ?? "Error"
    }
    
    
    var percentage: String {
        return self.objc.percentage ?? "Error"
    }
}
