//
//  ScreenBViewModel.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import Foundation

class ScreenBViewModel {
    
    private(set) var dataTitle: String? = "Screen B"

    
    public func calcBirthday(birthday: String) -> Bool {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        let birthdayDate = dateFormater.date(from: birthday) ?? Date()+1
        let now = Date()
        
        return birthdayDate < now 
    }

}
