//
//  DemoLoginScreenTests.swift
//  DemoAppUITests
//
//  Created by Kaustubh Deo on 28/06/23.
//

import XCTest

final class DemoLoginScreenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK : - testLoginScreen
    func testLoginScreen() throws {
        // When
        let app = XCUIApplication ()
        app.launch()

        // Given
        let button = app.buttons ["Login"]
        button.tap()
        
        let usernameField = app.textFields ["Enter Email"]
        usernameField.tap ()
        usernameField.typeText("hello@test.com")

        let passwordSecureTextField = app.secureTextFields["Enter Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("Admin@123")

        let buttonSubmit = app.buttons ["Submit"]
        
        // Then
        XCTAssertTrue (usernameField.exists)
        XCTAssertTrue (passwordSecureTextField.exists)
        XCTAssertTrue (buttonSubmit.exists)
    }
    
    // MARK : - testLoginScreenValidEmailAlert
    func testLoginScreenInValidEmailAlert() throws {
        // When
        let app = XCUIApplication ()
        app.launch()

        // Given
        let button = app.buttons ["Login"]
        button.tap()

        let usernameField = app.textFields ["Enter Email"]
        usernameField.tap ()
        usernameField.typeText("hellotest.com") // Enter invalid email
        
        let passwordSecureTextField = app.secureTextFields["Enter Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("Admin@123")

        let buttonSubmit = app.buttons ["Submit"]
        buttonSubmit.tap()
        
        let alert = app.alerts.element.staticTexts["Please enter valid email"]
        
        // Then
        XCTAssertTrue (alert.exists)
    }
    
    // MARK: - testLoginScreenValidPasswordAlert
    func testLoginScreenInValidPasswordAlert() throws {
        // When
        let app = XCUIApplication ()
        app.launch()

        // Given
        let button = app.buttons ["Login"]
        button.tap()

        let usernameField = app.textFields ["Enter Email"]
        usernameField.tap ()
        usernameField.typeText("hello@test.com")
        
        let passwordSecureTextField = app.secureTextFields["Enter Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("t") // Enter less then 3 characters in password field

        let buttonSubmit = app.buttons ["Submit"]
        buttonSubmit.tap()
        
        let alert = app.alerts.element.staticTexts["Please enter valid password"]
        
        // Then
        XCTAssertTrue (alert.exists)
    }
    
    // MARK: - testLoginScreenInvalidCredentialsAlert
    func testLoginScreenInvalidCredentialsAlert() throws {
        // When
        let app = XCUIApplication ()
        app.launch()

        // Given
        let button = app.buttons ["Login"]
        button.tap()

        let usernameField = app.textFields ["Enter Email"]
        usernameField.tap ()
        usernameField.typeText("hello@test.com")
        
        let passwordSecureTextField = app.secureTextFields["Enter Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("test123") // Enter less then 3 characters in password field

        let buttonSubmit = app.buttons ["Submit"]
        buttonSubmit.tap()
        
        let expectation = expectation(description: "AuthDataResult")

        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when) {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 30) { (error) in
        }
        
        let alert = app.alerts.element.staticTexts["Please enter valid email and password"]
        
        // Then
        XCTAssertTrue (alert.exists)
    }
}
