//
//  DemoInitialScreenTests.swift
//  DemoAppUITests
//
//  Created by Kaustubh Deo on 28/06/23.
//

import XCTest

final class DemoInitialScreenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - testInitialScreen
    func testInitialScreen() throws {
        // When
        let app = XCUIApplication ()
        app.launch()

        // Given
        let createAccount = app.buttons ["Create Account"]
        let button = app.buttons ["Login"]
        
        // Then
        XCTAssertTrue (createAccount.exists)
        XCTAssertTrue (button.exists)
    }
}
