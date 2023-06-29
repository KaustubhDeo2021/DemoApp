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

    // MARK: - testSignInSuccess
    func testSignInSuccess() throws {
        
        // Given
        let loginViewModel = LoginViewModel(loginUsecase: MockLoginUsecase(result: true), emailValidationUsecase: EmailValidationUsecase())
        
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
    
    
    // MARK: - testSignInFailure
    func testSignInFailure() throws {
        
        // Given
        let loginViewModel = LoginViewModel(loginUsecase: MockLoginUsecase(result: false), emailValidationUsecase: EmailValidationUsecase())
        
        // When
        var authDataResult: AuthDataResult?
        let expectation = expectation(description: "AuthDataResult")
        loginViewModel.signIn(email: "hello@test.com", password: "Admin@123") { (firebaseResult, error) in
            if error != nil {
                expectation.fulfill()
            } else {
                authDataResult = firebaseResult
                expectation.fulfill()
            }
        }
        
        // Then
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(authDataResult)
        }
    }
    
    // MARK: - testIsValidEmail
    func testIsValidEmail() throws {
        let loginViewModel = LoginViewModel(loginUsecase: MockLoginUsecase(result: true), emailValidationUsecase: EmailValidationUsecase())
        XCTAssertTrue(loginViewModel.isValidEmail("hello@test.com"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
