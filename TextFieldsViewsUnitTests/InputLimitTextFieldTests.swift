//
//  TextFieldsUnitTests.swift
//  TextFieldsUnitTests
//
//  Created by Artem Shcherban on 01.04.2022.
//

import XCTest
@testable import TextFields

class InputLimitTextFieldTests: XCTestCase {
    private var textField: InputLimitTextField!
    private var limit = AppConstants.maxNumberOfCharacters
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        textField = InputLimitTextField()
    }
    
    override func tearDownWithError() throws {
        textField = nil
        try super.tearDownWithError()
    }
    
    private func getStringColors(_ string: String) -> (UIColor?, UIColor?) {
        let startRange = NSRange(location: 0, length: limit)
        let endRange = NSRange(location: limit, length: (textField.text?.count ?? 0) - limit)
        let beginning = textField.attributedText?.attributedSubstring(from: startRange)
        let ending = textField.attributedText?.attributedSubstring(from: endRange)
        
        let colorOne = beginning?.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil)
        let colorTwo = ending?.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil)
        
        return (colorOne as? UIColor, colorTwo as? UIColor)
    }
    
    func testSetColorForBorderWithFifteenSymbolsString() {
        textField.text = "123456789012345"
        
        textField.setColors()
        
        XCTAssertEqual(textField.layer.borderColor, UIColor.red.cgColor)
    }
    
    func testSetColorForBorderWithTenSymbolsString() {
        textField.text = "1234567890"
        
        textField.setColors()
        
        XCTAssertEqual(textField.layer.borderColor, ColorConstants.blueColor.cgColor)
        XCTAssertEqual(textField.textColor, ColorConstants.graphiteColor)
    }
    
    func testSetColorForBorderWithFiveSymbolsString() {
        textField.text = "12345"
        
        textField.setColors()
        
        XCTAssertEqual(textField.layer.borderColor, ColorConstants.blueColor.cgColor)
    }
    
    func testSetTextColorFifteenSymbolsString() {
        let expectedColorOne = ColorConstants.graphiteColor
        let expctedColorTwo = UIColor.red
        textField.text = "Hello, world!!!"
        
        textField.setColors()
        let stringColors: (colorOne: UIColor?, colorTwo: UIColor?) = getStringColors(textField.text ?? "")
        
        XCTAssertEqual(stringColors.colorOne, expectedColorOne)
        XCTAssertEqual(stringColors.colorTwo, expctedColorTwo)
    }
}
