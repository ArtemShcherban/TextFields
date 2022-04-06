//
//  InitialViewButtonTests.swift
//  TextFieldsUITests
//
//  Created by Artem Shcherban on 01.04.2022.
//

import XCTest

final class InitialViewButtonsUITests: XCTestCase {
    private var app: XCUIApplication!
    
    private lazy var singleViewButton = app.buttons["Single View Controller"]
    private lazy var multipleViewsButton = app.buttons["Multiple Views Controller"]
    private lazy var noDightsTextField = app.textFields["NO dights"]
    private lazy var inputLimitTextField = app.textFields["Input Limit"]
    private lazy var onlyCharTextField = app.textFields["Only characters"]
    private lazy var linkTextField = app.textFields["Link"]
    private lazy var validationTextField = app.secureTextFields["Password"]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testSingleViewControllerAppearOnTap() {
        singleViewButton.tap()
        XCTAssertTrue(app.textFields[noDightsTextField.identifier].exists)
        XCTAssertTrue(app.textFields[inputLimitTextField.identifier].exists)
        XCTAssertTrue(app.textFields[onlyCharTextField.identifier].exists)
        XCTAssertTrue(app.textFields[linkTextField.identifier].exists)
        XCTAssertTrue(app.secureTextFields[validationTextField.identifier].exists)
    }
    
    func testMultipleViewsControllerAppearOnTap() {
        let expectedTabBar = "MultipleViewsTabBar"
        
        multipleViewsButton.tap()
        
        XCTAssertTrue(app.textFields[noDightsTextField.identifier].exists)
        XCTAssertTrue(app.tabBars[expectedTabBar].exists)
    }
}
