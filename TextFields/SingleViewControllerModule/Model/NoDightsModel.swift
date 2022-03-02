//
//  NoDightsModel.swift
//  TextFields
//
//  Created by Artem Shcherban on 12.02.2022.
//

import Foundation

class NoDightsModel {
    
    func digitsExclusion(_ string: String) -> String {
        
        let excludedСharacters = CharacterSet(charactersIn: AppConstants.setOfNumbers)
        let componentsArray = string.components(separatedBy: excludedСharacters)
        let updatedString = componentsArray.joined(separator: "")
        
        return updatedString
    }
    
}
