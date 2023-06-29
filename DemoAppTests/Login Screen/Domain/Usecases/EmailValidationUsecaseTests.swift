//
//  EmailValidationUsecaseTests.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 26/06/23.
//

import XCTest
@testable import Firebase
@testable import DemoApp
final class EmailValidationUsecaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - testIsValidEmail
    func testIsValidEmail() throws {
        
        let emailValidationUsecase = EmailValidationUsecase()
        XCTAssertTrue(emailValidationUsecase.isValidEmail("hello@test.com"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
