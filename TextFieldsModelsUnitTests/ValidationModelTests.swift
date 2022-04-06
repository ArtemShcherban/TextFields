//
//  ValidationModelTests.swift
//  TextFieldsModelTests
//
//  Created by Artem Shcherban on 30.03.2022.
//

import XCTest
@testable import TextFields

final class ValidationModelTests: XCTestCase {
    private var modelUnderTest: ValidationModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        modelUnderTest = ValidationModel()
    }
    
    override func tearDownWithError() throws {
        modelUnderTest = nil
        try super.tearDownWithError()
    }
    
    func testFollowTwoRules() {
        // given
        let password = "SW2022"
        let expectedResult = (rules: [false, true, false, true], strength: 2)
        
        // when
        let result: (rules: [Bool], strength: Int) = modelUnderTest.checkPassword(password)
        
        // then
        XCTAssertEqual(result.rules, expectedResult.rules, "Arrays should be the same")
        XCTAssertEqual(result.strength, expectedResult.strength, "Strength should be the same")
    }
    
    func testFollowingAllRules() {
        // given
        let password = "Swift2022"
        let expectedResult = (rules: [true, true, true, true], strength: 4)
        
        // when
        let result: (rules: [Bool], strength: Int) = modelUnderTest.checkPassword(password)
        
        // then
        XCTAssertEqual(result.rules, expectedResult.rules, "Arrays should be the same")
        XCTAssertEqual(result.strength, expectedResult.strength, "Strength should be the same")
    }
}
