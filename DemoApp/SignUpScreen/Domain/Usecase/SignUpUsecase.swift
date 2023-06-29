//
//  SignUpUsecase.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit
import Firebase
protocol SignUpProtocol {
    func createUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
}

class SignUpUsecase: SignUpProtocol {
    
    
    func createUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
 
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
             completion(firebaseResult, error)
        }
    }
}
