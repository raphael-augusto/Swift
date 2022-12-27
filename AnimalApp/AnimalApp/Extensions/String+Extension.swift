//
//  String+Extension.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 06/12/22.
//

import Foundation


extension String {
    
    var length: Int { return self.count }
    
    func weightInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = MeasurementFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.numberFormatter.maximumFractionDigits = 2
        formatter.numberFormatter.minimumFractionDigits = 2

        var amountWithPrefix = self
        
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, length), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        guard number != 0 as NSNumber else {
            return ""
        }

        let data = Measurement(value: number as! Double, unit: UnitMass.kilograms)
                
        return formatter.string(from: data)
    }
    
    
    //MARK: - REGEX
    func match(_ regex: String) -> [[String]] {
        let nsString = self as NSString
        return (try? NSRegularExpression(pattern: regex, options: []))?.matches(in: self, options: [], range: NSMakeRange(0, nsString.length)).map { match in
            (0..<match.numberOfRanges).map { match.range(at: $0).location == NSNotFound ? "" : nsString.substring(with: match.range(at: $0)) }
        } ?? []
    }
}
