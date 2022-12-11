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
                     "Ragdoll","Ashera","American Shorthair", "Exótico","SRD - Sem Raça Definida", "IMC"].shuffled()
        let data = names
        
        for name in data {
            dataAnimal.animal.append(AnimalData(name: name))
        }
    }
    
    
    var count: Int {
        return dataAnimal.animal.count
    }
    
    
    func getAnimal(indexPath: IndexPath) -> AnimalData {
        return dataAnimal.animal[indexPath.row]
    }
    
}
