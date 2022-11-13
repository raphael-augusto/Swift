//
//  ScreenBViewModel.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import Foundation

class ScreenBViewModel {
    
    private(set) var dataTitle: String? = "Screen B"
    
    
    public func calcAge(birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate ?? now, to: now, options: [])
        let age = calcAge.year
        return age!
    }
    
}
