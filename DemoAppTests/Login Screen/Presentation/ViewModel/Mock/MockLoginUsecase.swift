//
//  MockLoginUsecase.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 27/06/23.
//

import UIKit
@testable import Firebase
@testable import DemoApp
class MockLoginUsecase: LoginProtocol{
    
    let result: Bool
    
    init(result: Bool) {
        self.result = result
    }
    
    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
        
        if FirebaseApp.app() == nil {
                
            FirebaseApp.configure()
        }
        
        var authDataResult: AuthDataResult?
        
        if result == true {
            Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
                completion(firebaseResult, error)
            }
        } else {
            completion(authDataResult, NSError())
        }
        
    }
}
