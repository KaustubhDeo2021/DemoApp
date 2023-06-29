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
    
    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
        
        if FirebaseApp.app() == nil {
                
            FirebaseApp.configure()
        }
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            completion(firebaseResult, error)
        }
    }
}
