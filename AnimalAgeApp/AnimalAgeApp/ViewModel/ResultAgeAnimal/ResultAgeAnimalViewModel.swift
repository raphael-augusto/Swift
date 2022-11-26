//
//  ResultAgeAnimalViewModel.swift
//  AnimalAgeApp
//
//  Created by Raphael Augusto on 24/11/22.
//

import UIKit

enum PortAnimal: String {
    
    case small
    case medium
    case big

    var image: UIImage {
        switch self {
        case .small:
            return UIImage(imageLiteralResourceName:"porte_pequeno")
        case .medium:
            return UIImage(imageLiteralResourceName:"porte_medio")
        case .big:
            return UIImage(imageLiteralResourceName:"porte_grande")
        }
    }
}


class ResultAgeAnimalViewModel {
    
    
    public func animalAge (age: String, portAnimal: PortAnimal) -> String {
        switch portAnimal {
        case .small:
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            let year = dateFormatter.string(from: date)
        
            let data = (Double(year)! - (Double(age) ?? 0))
            return "Sua idade canina é: \(String(data))"
            
        case .medium:
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            let year = dateFormatter.string(from: date)
        
            let data = (Double(year)! - (Double(age) ?? 0))
            return "Sua idade canina  é: \(String(data))"
            
        case .big:
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            let year = dateFormatter.string(from: date)
            
            let data = (Double(year)! - (Double(age) ?? 0))
            return "Sua idade canina  é: \(String(data))"
        }
    }
    
    
    public func humanAge (age: String, portAnimal: PortAnimal) -> String {
        switch portAnimal {
        case .small:
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            let year = dateFormatter.string(from: date)
        
            let data = (Double(year)! - (Double(age) ?? 0)) * 6
            return "Sua idade humana é: \(String(data))"
            
        case .medium:
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            let year = dateFormatter.string(from: date)
        
            let data = (Double(year)! - (Double(age) ?? 0))  * 7
            return "Sua idade humana é: \(String(data))"
            
        case .big:
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            let year = dateFormatter.string(from: date)
            
            let data = (Double(year)! - (Double(age) ?? 0))  * 7.5
            return "Sua idade humana é: \(String(data))"
        }
    }
    
    
    public func animalImage(portAnimal: PortAnimal) -> UIImage  {
        switch portAnimal {
        case .small:
            return portAnimal.image
        case .medium:
            return portAnimal.image
        case .big:
            return portAnimal.image
        }
    }
}
