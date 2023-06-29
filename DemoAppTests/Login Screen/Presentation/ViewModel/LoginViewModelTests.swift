//
//  LoginViewModelTests.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 26/06/23.
//

import XCTest
@testable import Firebase
@testable import DemoApp
final class LoginViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - testSignIn
    func testSignIn() throws {
        
        // Given
        let loginViewModel = LoginViewModel(loginUsecase: MockLoginUsecase(), emailValidationUsecase: EmailValidationUsecase())
        
        // When
        var authDataResult: AuthDataResult?
        let expectation = expectation(description: "AuthDataResult")
        loginViewModel.signIn(email: "hello@test.com", password: "Admin@123") { (firebaseResult, error) in
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
    
    // MARK: - testIsValidEmail
    func testIsValidEmail() throws {
        let loginViewModel = LoginViewModel(loginUsecase: MockLoginUsecase(), emailValidationUsecase: EmailValidationUsecase())
        XCTAssertTrue(loginViewModel.isValidEmail("hello@test.com"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
