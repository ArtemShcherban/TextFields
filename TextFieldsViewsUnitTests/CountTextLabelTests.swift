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
    
    func testUpdateTextColorForNegativeValue() {
        countTextLabel.text = "-5"
    
        XCTAssertEqual(countTextLabel.textColor, UIColor.red)
    }
    
    func testUpdateTextColorPositiveValue() {
        countTextLabel.text = "5"
        
        XCTAssertEqual(countTextLabel.textColor, ColorConstants.graphiteColor)
    }
    
    func testUpdateTextColorZeroValue() {
        countTextLabel.text = "0"
    
        XCTAssertEqual(countTextLabel.textColor, ColorConstants.graphiteColor)
    }
}
