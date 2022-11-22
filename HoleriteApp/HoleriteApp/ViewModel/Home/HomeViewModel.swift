//
//  HomeViewModel.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 14/11/22.
//

import Foundation

class HomeViewModel {
    
    private(set) var dataTitle: String? = "Holerite"
    
    
    public func validateGrossSalary(with grossSalary: String) -> String {
        let salary = grossSalary.removeCharacters(from: "R$. ")
        let dataTreatment:String = salary.replacingOccurrences(of: ",", with: ".").trimmingCharacters(in: .whitespacesAndNewlines)
        let dataSalary = Double(dataTreatment) ?? 0
        
        return dataSalary > 0 ? String(format: "%.2f", dataSalary) : ""
    }
    
    
    public func validateDiscount(with discount: String) -> String {
        let discountAmount = discount.removeCharacters(from: "R$. ")
        let dataTreatment:String = discountAmount.replacingOccurrences(of: ",", with: ".").trimmingCharacters(in: .whitespacesAndNewlines)
        let dataDiscount = Double(dataTreatment) ?? 0
        
        return dataDiscount >= 0 ? String(format: "%.2f", dataDiscount) : "0"
    }
}
