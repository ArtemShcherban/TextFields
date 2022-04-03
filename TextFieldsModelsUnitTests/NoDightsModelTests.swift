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
    
    func testNoDightsModel() {
        XCTAssertEqual(modelUnderTest.digitsExclusion("Swift2022"), "Swift")
        XCTAssertEqual(modelUnderTest.digitsExclusion("Swift2022Swift"), "SwiftSwift")
        XCTAssertEqual(modelUnderTest.digitsExclusion("@2022Swift2022@"), "@Swift@")
    }
}
