//
//  ScreenAViewModel.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import Foundation


class ScreenAViewModel {
    
    private(set) var dataTitle: String? = "Screen A"
    
    
    func validateUserName(_ userName:String) -> Bool {
        guard userName.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").count > 1 else { return false }
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$")
        return predicate.evaluate(with: userName)
    }
}
