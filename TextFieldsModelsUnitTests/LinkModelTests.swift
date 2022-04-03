//
//  LinkModelTests.swift
//  TextFieldsModelTests
//
//  Created by Artem Shcherban on 01.04.2022.
//

import XCTest
@testable import TextFields

final class LinkModelTests: XCTestCase {
    private var modelUnderTest: LinkModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        modelUnderTest = LinkModel()
    }
    
    override func tearDownWithError() throws {
        modelUnderTest = nil
        try super.tearDownWithError()
    }
    
    func testLinkModel() {
        XCTAssertTrue(modelUnderTest.checkStringIsLink("http://google.ua"))
        XCTAssertTrue(modelUnderTest.checkStringIsLink("https://google.ua"))
        XCTAssertTrue(modelUnderTest.checkStringIsLink("http://google.com"))
        XCTAssertTrue(modelUnderTest.checkStringIsLink("https://google.com"))
        XCTAssertTrue(modelUnderTest.checkStringIsLink("http://google.com.ua"))
        XCTAssertTrue(modelUnderTest.checkStringIsLink("https://google.com.ua"))
        XCTAssertFalse(modelUnderTest.checkStringIsLink("https://google"))
        XCTAssertFalse(modelUnderTest.checkStringIsLink("http://google"))
        XCTAssertFalse(modelUnderTest.checkStringIsLink("www.google.com"))
        XCTAssertFalse(modelUnderTest.checkStringIsLink("www.google.ua"))
    }
}
