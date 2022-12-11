//
//  HomeIMCViewModel.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 06/12/22.
//

import Foundation

class HomeIMCViewModel {
    

    func validationDataIMC (with weight: String, height: String ) -> IMCData {
        let dataWeight: String = validateWeight(with: weight)
        let dataHeight: String = validateWeight(with: height)

        return IMCData(weight: dataWeight, height: dataHeight)
    }

    
    func validateWeight(with weight: String) -> String {
        let data = Double(weight.replacingOccurrences(of: ",", with: ".")) ?? 0.0
        
        return data.sign == .minus ? String(0) : String(data)
    }
    
    
    func validateHeight(with height: String) -> String {
        let data = Double(height.replacingOccurrences(of: ",", with: ".")) ?? 0.0
        
        return data.sign == .minus ? String(0) : String(data)
    }
}
