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
    
    public func AnimalAge (age: String, portAnimal: PortAnimal) -> String {
        switch portAnimal {
        case .small:
            let data = (Double(age) ?? 0) * 6
            print(data)
            return "Sua humana idade é: \(String(data))"
        case .medium:
            let data = (Double(age) ?? 0)  * 7
            return "Sua humana idade é: \(String(data))"
        case .big:
            let data = (Double(age) ?? 0)  * 7.5
            return "Sua humana idade é: \(String(data))"
        }
    }
    
    
    public func AnimalImage(portAnimal: PortAnimal) -> UIImage  {
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
