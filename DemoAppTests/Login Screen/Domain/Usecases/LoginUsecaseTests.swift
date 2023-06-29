//
//  LoginUsecaseTests.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 27/06/23.
//

import XCTest
@testable import Firebase
@testable import DemoApp
final class LoginUsecaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - testCreateUser
    func testCreateUser() throws {
        // Given
        let loginUsecase = LoginUsecase()
        
        // When
        var authDataResult: AuthDataResult?
        let expectation = expectation(description: "AuthDataResult")
        let randomDouble = Double.random(in: 2.71828...3.14159) // This will create new account every time..if the testcase fails then we have to manually delete created account ..
        loginUsecase.signIn(email: "hello2@test.com", password: "Admin@123"){ (firebaseResult, error) in
            if error != nil {
                print("error")
            } else {
                authDataResult = firebaseResult
                expectation.fulfill()
            }
        }
        
        // Then
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNotNil(authDataResult)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
