//
//  InputLimitModel.swift
//  TextFields
//
//  Created by Artem Shcherban on 13.02.2022.
//

import Foundation

final class InputLimitModel {
    
    func characterCounter(_ string: String) -> String {
        
        String(AppConstants.maxNumberOfCharacters - string.count)
    }
}
