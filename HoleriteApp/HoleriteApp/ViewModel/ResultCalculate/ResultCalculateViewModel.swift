//
//  ResultCalculateViewModel.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 16/11/22.
//

import Foundation


class ResultCalculateViewModel {
    
    private(set) var dataHolerite = HoleriteModel(result: [])
    
    
    var count: Int {
        return dataHolerite.result.count
    }
        

    
    func getIndex(indexPath: IndexPath) -> Holeritedata {
        return dataHolerite.result[indexPath.row]
    }
    
    
    public func getData (salary: String, discount: String) {
        dataHolerite.result.append(Holeritedata(name: "Salário Bruto",value: salary.currencyInputFormatting(), percentage: "", isDiscount: false))
        dataHolerite.result.append(Holeritedata(name: "Descontos",value: discount.currencyInputFormatting(), percentage: "", isDiscount: true))
        dataHolerite.result.append(Holeritedata(name: "Desconsto INSS",value: self.calculateDiscountINSS(with: salary).currencyInputFormatting(),percentage: "8%", isDiscount: true))
        dataHolerite.result.append(Holeritedata(name: "Desconto IRRF",value: "R$ 0,00",percentage: "0%", isDiscount: nil))
        dataHolerite.result.append(Holeritedata(name: "Salário liquido",value: self.calculateNetsalary(with: salary, discount: discount),percentage: "", isDiscount: false))
    }


    
    public func calculateDiscountINSS(with salary: String) -> String {
        let salaryAmount: Double = Double(salary) ?? 0
        let discountINSS: Double = salaryAmount * 0.08
        
        return String(format: "%.2f", discountINSS)
    }
    
    
    public func calculateNetsalary(with salary: String, discount: String ) -> String? {
        let salaryAmount: Double = Double(salary) ?? 0
        let discountAmount: Double = salaryAmount - (Double(discount) ?? 0)
        let discountINSS:String = calculateDiscountINSS(with: String(salaryAmount))
        let netSalary: Double = discountAmount - (Double(discountINSS) ?? 0.0)
        
        return String(format: "%.2f", netSalary).currencyInputFormatting()
    }
}
