//
//  TextFieldsModelTests.swift
//  TextFieldsModelTests
//
//  Created by Artem Shcherban on 29.03.2022.
//

import XCTest
@testable import TextFields

final class OnlyCharModelTests: XCTestCase {
    private var modelUnderTest: OnlyCharModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        modelUnderTest = OnlyCharModel()
    }
    
    override func tearDownWithError() throws {
        modelUnderTest = nil
        try super.tearDownWithError()
    }
    
    func testFirstPartOfMask() {
        XCTAssertEqual(modelUnderTest.maskApplication("Q"), "Q")
        XCTAssertEqual(modelUnderTest.maskApplication("QQ3"), "QQ")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQ$"), "QQQQ")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ"), "QQQQQ-")
    }
    
    func testSecondPartOfMask() {
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ-Q"), "QQQQQ-")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ-1"), "QQQQQ-1")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ-"), "QQQQQ")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ1"), "QQQQQ-")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ-12Q"), "QQQQQ-12")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ-123$"), "QQQQQ-123")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ-12345"), "QQQQQ-12345")
        XCTAssertEqual(modelUnderTest.maskApplication("QQQQQ-123456"), "QQQQQ-12345")
    }
}
