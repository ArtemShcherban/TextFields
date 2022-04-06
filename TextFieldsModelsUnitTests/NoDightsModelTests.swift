//
//  NoDightsModelTests.swift
//  TextFieldsModelTests
//
//  Created by Artem Shcherban on 01.04.2022.
//

import XCTest
@testable import TextFields

final class NoDightsModelTests: XCTestCase {
    private var modelUnderTest: NoDightsModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        modelUnderTest = NoDightsModel()
    }
    
    override func tearDownWithError() throws {
        modelUnderTest = nil
        try super.tearDownWithError()
    }
    
    func testInputedStringlWithDightsAtTheEnd() {
        XCTAssertEqual(modelUnderTest.digitsExclusion("Swift2022"), "Swift")
    }
    
    func testInputedStringWithDigitsAtTheBeginning() {
        XCTAssertEqual(modelUnderTest.digitsExclusion("2022Swift"), "Swift")
    }
    
    func testInputedStringWithDightsInTheMiddle() {
        XCTAssertEqual(modelUnderTest.digitsExclusion("Swift2022Swift"), "SwiftSwift")
    }
    
    func testInputedStringWithDigitsAndSymbols() {
        XCTAssertEqual(modelUnderTest.digitsExclusion("@2022$Swift$2022@"), "@$Swift$@")
    }
}
