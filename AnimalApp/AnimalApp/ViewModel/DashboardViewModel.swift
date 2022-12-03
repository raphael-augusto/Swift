//
//  DashboardViewModel.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 01/12/22.
//

import Foundation


class DashboardViewModel {

    
    private(set) var dataAnimal = AnimalRaceModel(animal: [])

    
    public func getAnimalData () {
        let names = ["Persa", "Siamês", "Maine Coon", "Angorá", "Sphynx",
                     "Ragdoll","Ashera","American Shorthair", "Exótico","SRD - Sem Raça Definida"]
        let data = randomElementsFromArray(names, numberOfElements: names.count)!
        
        for name in data {
            dataAnimal.animal.append(AnimalData(name: name))
        }
    }
    
    
    var count: Int {
        return dataAnimal.animal.count
    }
    
    
    func getIndex(indexPath: IndexPath) -> AnimalData {
        return dataAnimal.animal[indexPath.row]
    }
    
    
    private func randomElementsFromArray<Generic>(_ array: [Generic], numberOfElements: Int) -> [Generic]? {
        guard array.count >= numberOfElements else { return nil }
        
        var toDeplete = array
        var toReturn = [Generic]()
        
        while toReturn.count < numberOfElements {
            toReturn.append(toDeplete.remove(at: Int.random(in: 0..<toDeplete.count)))
        }
        
        
        return toReturn
    }
}
