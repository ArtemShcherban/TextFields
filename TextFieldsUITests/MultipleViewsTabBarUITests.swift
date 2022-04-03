//
//  MultipleViewsTabBarUITests.swift
//  TextFieldsUITests
//
//  Created by Artem Shcherban on 01.04.2022.
//

import XCTest

final class MultipleViewsTabBarUITests: XCTestCase {
    private var app: XCUIApplication!
    
    private lazy var multipleViewsTabBar = app.tabBars["MultipleViewsTabBar"]
    private lazy var multipleViewsButton = app.buttons["Multiple Views Controller"]
    private lazy var noDightsTextField = app.textFields["NO dights"]
    private lazy var inputLimitTextField = app.textFields["Input Limit"]
    private lazy var onlyCharTextField = app.textFields["Only characters"]
    private lazy var linkTextField = app.textFields["Link"]
    private lazy var validationTextField = app.secureTextFields["Password"]
    private lazy var textFields = [noDightsTextField, inputLimitTextField, onlyCharTextField, linkTextField]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testTabBarButtonsDifferentViewControllersShouldAppearOnTap() {
        
        multipleViewsButton.tap()
        for number in 1...3 {
            multipleViewsTabBar.buttons["\(number)"].tap()
            
            XCTAssertTrue(textFields[number].exists)
        }
    }
    
    func testTabBarPasswordButtonPressedValidationRulesViewControllerShouldAppear() {
        let number = "4"
        
        multipleViewsButton.tap()
        multipleViewsTabBar.buttons[number].tap()
        validationTextField.tap()
        
        XCTAssertTrue(validationTextField.exists)
    }
}
