//
//  CarViewModel.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 24/12/22.
//

import UIKit

class CarViewModel {
    
    
    func validatePlateCar(plate: String) -> String? {
        let countPlateNumber = plate.match("[0-9]").count
        let countPlateString = plate.match("[A-Z]").count
        
        return countPlateString == 4 && countPlateNumber == 3 ? plate : nil
    }
}
