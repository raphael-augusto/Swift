//
//  Date+Extension.swift
//  AppClock
//
//  Created by Raphael Augusto on 07/11/22.
//

import Foundation

extension Date  {
    var displayFomat: String {
        self.formatted(
            .dateTime
                .hour(.conversationalTwoDigits(amPM: .omitted))
                .minute(.twoDigits)
        )
    }
    
    var displayFomatHour: String {
        self.formatted(
            .dateTime
                .hour(.conversationalTwoDigits(amPM: .omitted))
        )
    }
}
