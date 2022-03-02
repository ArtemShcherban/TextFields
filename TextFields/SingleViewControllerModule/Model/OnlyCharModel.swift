//
//  OnlyCharactersModel.swift
//  TextFields
//
//  Created by Artem Shcherban on 16.02.2022.
//

import Foundation

final class OnlyCharModel {
    
    private static let mask = AppConstants.textFieldPlaceholdersArray[2]
    private var newString = ""
    
    func maskApplication(_ string: String) -> String {
        if !string.isEmpty {
            if string.count <= Self.mask.count {
                switch Self.mask[string.index(before: string.endIndex)] {
                case "W":
                    return checkLettersOrNumbers(string, AppConstants.alphabetletters)
                case "D":
                    return checkLettersOrNumbers(string, AppConstants.setOfNumbers)
                case "-":
                    return checkForDash(string)
                default:
                    break
                }
            }
            newString = string
            newString.removeLast()
            return newString
        }
        return string
    }
    
    private func checkLettersOrNumbers(_ string: String, _ comparisonString: String) -> String {
        newString = string
        if comparisonString.contains(newString.last ?? Character("")) {
            if string.count < Self.mask.count && Self.mask[string.endIndex] == "-" {
                return newString + "-"
            } else {
                return newString
            }
        } else {
            newString.removeLast()
            return newString
        }
    }
    
    private func checkForDash(_ string: String) -> String {
        if newString.count > string.count {
            newString.removeLast(2)
            return newString
        } else {
            return newString + "-"
        }
    }
}
