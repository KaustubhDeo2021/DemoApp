//
//  LoginUsecase.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit
import Firebase
protocol LoginProtocol {
    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ())
}

class LoginUsecase: LoginProtocol{
    
    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            completion(firebaseResult, error)
        }
    }
}
