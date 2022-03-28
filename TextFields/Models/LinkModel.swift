//
//  LinkModel.swift
//  TextFields
//
//  Created by Artem Shcherban on 19.02.2022.
//

import Foundation

final class LinkModel {
    
    func checkStringIsLink(_ string: String) -> Bool {
        
        if string.lowercased().prefix(4).contains("http") == true &&
            ( string.lowercased()[string.index(string.endIndex, offsetBy: -4)] == "." ||
              string.lowercased()[string.index(string.endIndex, offsetBy: -3)] == "." ) {
            return true
        } 
        return false
    }
}
