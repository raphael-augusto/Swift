//
//  ResultIMCViewModel.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 10/12/22.
//

import UIKit


class ResultIMCViewModel {
    
    private lazy var imc: Double = 0
    private lazy var result: String = ""
    
    
    func resultIMC(weight: String, height:String) -> String {
        
        if let weight = Double(weight), let height = Double(height) {
            imc = weight / pow(height, 2)
        }
        
        
        return String(format: "%.2f", imc)
    }
    
    func calculate () -> String {
        
        switch imc {
            case 0..<16:
                result = "Magreza"
            case 16..<18.5:
                result = "abaixo"
            case 18.5..<25:
                result = "ideal"
            case 25..<30:
                result = "sobrepeso"
            default:
                result = "obesidade"
        }
        
        return result
    }
}
