//
//  DashboardViewModel.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 01/12/22.
//

import Foundation


protocol DescriptionProtocol {
    var descriptionName: String? { get }
}


class DashboardViewModel {

    private(set) var dataValue: [DescriptionProtocol] = [AnimalData(descriptionName: "Persa"),
                                                         AnimalData(descriptionName: "Siamês"),
                                                         AnimalData(descriptionName: "Maine Coon"),
                                                         AnimalData(descriptionName: "Angorá"),
                                                         AnimalData(descriptionName: "Sphynx"),
                                                         AnimalData(descriptionName: "Ragdoll"),
                                                         AnimalData(descriptionName: "Ashera"),
                                                         AnimalData(descriptionName: "American Shorthair"),
                                                         AnimalData(descriptionName: "Exótico"),
                                                         AnimalData(descriptionName: "SRD - Sem Raça Definida"),
                                                         IMCData()
                                            ].shuffled()
    
    
    var count: Int {
        return dataValue.count
    }
    
    
    func getNames(indexPath: IndexPath) -> DescriptionProtocol {
        return dataValue[indexPath.row]
    }
}
