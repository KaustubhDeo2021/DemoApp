//
//  MockSignUpViewModel.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit
@testable import DemoApp
@testable import Firebase

class MockSignUpUsecase: SignUpProtocol {
    
    let result: Bool
    
    init(result: Bool) {
        self.result = result
    }
    
    func createUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
 
        if FirebaseApp.app() == nil {
                
            FirebaseApp.configure()
        }
        
        var authDataResult: AuthDataResult?
        
        if result == true {
            
            Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
                authDataResult = firebaseResult
                completion(authDataResult, error)
            }
        } else {
            completion(authDataResult, NSError())
        }
    }
}
