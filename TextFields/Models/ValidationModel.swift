//
//  ValidationModel.swift
//  TextFields
//
//  Created by Artem Shcherban on 21.02.2022.
//

import Foundation

final class ValidationModel {
    private static let capitalletters = CharacterSet(charactersIn: AppConstants.alphabetletters)
    private static let letters = CharacterSet(charactersIn: AppConstants.alphabetletters.lowercased())
    private static let numbers = CharacterSet(charactersIn: AppConstants.setOfNumbers)
    
    func checkPassword(_ string: String) -> ([Bool], Int) {
        var numberOfFulfilledRules = 0
        let firstRule = string.count >= 8
        let secondRule = string.rangeOfCharacter(from: Self.numbers) != nil
        let thirdRule = string.rangeOfCharacter(from: Self.letters) != nil
        let fourthRule = string.rangeOfCharacter(from: Self.capitalletters) != nil
        
        let rulesArray = [firstRule, secondRule, thirdRule, fourthRule]
        
        rulesArray.forEach { numberOfFulfilledRules += $0 ? 1 : 0 }
        
        print(string)
        
        return (rulesArray, numberOfFulfilledRules)
    }
}
