//
//  CarResultViewModel.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 27/12/22.
//

import Foundation


enum NumberOfWeek: Int {
    case Segunda = 2
    case Terca   = 3
    case Quarta  = 4
    case Quinta  = 5
    case Sexta   = 6
    case Sabado  = 7
    case Domingo = 1
}


class CarResultViewModel {
    
    
    func validationDayPlateCar() -> String {
        let weekday = Calendar.current.component(.weekday, from: Date())
        
        switch NumberOfWeek(rawValue: weekday) {
        case .Segunda:
            return "hoje"
        case .Terca:
            return "hoje"
        case .Quarta:
            return "hoje"
        case .Quinta:
            return "hoje"
        case .Sexta:
            return "hoje"
        case .Sabado:
            return "daqui 3 dias"
        case .Domingo:
            return "amanhã"
            
        default:
            return "Error"
        }
    }
}
