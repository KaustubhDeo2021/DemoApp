//
//  DemoAppUITests.swift
//  DemoAppUITests
//
//  Created by Kaustubh Deo on 23/06/23.
//

import XCTest

final class DemoAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        
        let app = XCUIApplication ()
        app.launch()
        
        let createAccount = app.buttons ["Create Account"]
        XCTAssertTrue (createAccount.exists)

        let button = app.buttons ["Login"]
        XCTAssertTrue (button.exists)
        button.tap()

        let usernameField = app.textFields ["Enter Email"]
        XCTAssertTrue (usernameField.exists)
        usernameField.tap ()
        usernameField.typeText("hello@test.com")

        let passwordSecureTextField = app.secureTextFields["Enter Password"]
        XCTAssertTrue (passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("Admin@123")

        let buttonLogin = app.buttons ["Submit"]
        XCTAssertTrue (buttonLogin.exists)
        buttonLogin.tap()

        let expectation = expectation(description: "AuthDataResult")

        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when) {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 30) { (error) in
            app.tables.staticTexts["The Flash"].tap()
            app.buttons["Back"].tap()
        }

        let tabBar = app.tabBars["Tab Bar"]
        XCTAssertTrue (tabBar.exists)
        tabBar.buttons["circle.grid.3x3.fill"].tap()
        tabBar.buttons["arrowshape.turn.up.backward.fill"].tap()

        let buttonLogout = app.buttons ["Logout"]
        XCTAssertTrue (buttonLogout.exists)
        buttonLogout.tap()
    }
}
