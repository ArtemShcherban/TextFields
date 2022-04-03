//
//  CountTextLabelTests.swift
//  TextFieldsUnitTests
//
//  Created by Artem Shcherban on 03.04.2022.
//

import XCTest
@testable import TextFields

final class CountTextLabelTests: XCTestCase {
    
    private var countTextLabel: CountTextLabel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        countTextLabel = CountTextLabel()
    }
    
    override func tearDownWithError() throws {
        countTextLabel = nil
        try super.tearDownWithError()
    }
    
    func testSetColorForNegativeValue() {
        countTextLabel.text = "-5"
        
        countTextLabel.setTextColor()
        
        XCTAssertEqual(countTextLabel.textColor, UIColor.red)
    }
    
    func testSetColorForPositiveValue() {
        countTextLabel.text = "5"
        
        countTextLabel.setTextColor()
        
        XCTAssertEqual(countTextLabel.textColor, ColorConstants.graphiteColor)
    }
}
