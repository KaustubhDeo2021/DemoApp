//
//  SignUpViewModelTests.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 26/06/23.
//

import XCTest
@testable import DemoApp
@testable import Firebase
final class SignUpViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK : - testCreateUserSuccess
    func testCreateUserSuccess() throws {
        // Given
        let signUpViewModel = SignUpViewModel.init(signUpUsecase: MockSignUpUsecase(result: true))
        
        // When
        var authDataResult: AuthDataResult?
        let expectation = expectation(description: "AuthDataResult")
        let randomDouble = Double.random(in: 2.71828...3.14159) // This will create new account every time..if the testcase fails then we have to manually delete created account ..
        
        signUpViewModel.createUser(email: "hello\(randomDouble)@test.com", password: "Admin@123"){ (firebaseResult, error) in
            if error != nil {
                expectation.fulfill()
            } else {
                authDataResult = firebaseResult
                expectation.fulfill()
            }
        }
        
        
        waitForExpectations(timeout: 30) { (error) in
            
            // Then
            XCTAssertNotNil(authDataResult)
        }
    }
    
    
    // MARK : - testCreateUserFailure
    func testCreateUserFailure() throws {
        // Given
        let signUpViewModel = SignUpViewModel.init(signUpUsecase: MockSignUpUsecase(result: false))
        
        // When
        var authDataResult: AuthDataResult?
        let expectation = expectation(description: "AuthDataResult")
        let randomDouble = Double.random(in: 2.71828...3.14159) // This will create new account every time..if the testcase fails then we have to manually delete created account ..
        
        signUpViewModel.createUser(email: "hello\(randomDouble)@test.com", password: "Admin@123"){ (firebaseResult, error) in
            if error != nil {
                
                // Then
                XCTAssertNil(authDataResult)
                expectation.fulfill()
                
            } else {
                authDataResult = firebaseResult
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 30) { (error) in
            
            // Then
            XCTAssertNil(authDataResult)
        }
    }

    // MARK : - testIsValidEmail
    func testIsValidEmail() throws {
        
        let signUpViewModel = SignUpViewModel.init(signUpUsecase: MockSignUpUsecase(result: true), emailValidationUsecase: EmailValidationUsecase())
        XCTAssertTrue(signUpViewModel.isValidEmail("hello@test.com"))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
