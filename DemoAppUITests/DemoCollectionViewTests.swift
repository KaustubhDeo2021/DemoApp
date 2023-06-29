//
//  DemoCollectionViewTests.swift
//  DemoAppUITests
//
//  Created by Kaustubh Deo on 29/06/23.
//

import XCTest

final class DemoCollectionViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCollectionView() throws {
        // When
        let app = XCUIApplication ()
        app.launch()

        // Given
        let button = app.buttons ["Login"]
        button.tap()

        let usernameField = app.textFields ["Enter Email"]
        usernameField.tap ()
        usernameField.typeText("hello2@test.com") // Enter invalid email

        let passwordSecureTextField = app.secureTextFields["Enter Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("Admin@123")

        let buttonSubmit = app.buttons ["Submit"]
        buttonSubmit.tap()

        let expectation = expectation(description: "AuthDataResult")

        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when) {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 30) { (error) in
        }

        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["circle.grid.3x3.fill"].tap()
         
        // Then
        XCTAssertTrue (app.collectionViews.element.exists) // Here we are checking if CollectionView is loading
        
    }
}
