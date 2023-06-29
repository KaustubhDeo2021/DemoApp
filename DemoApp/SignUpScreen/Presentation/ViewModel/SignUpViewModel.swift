//
//  SignUpViewModel.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit
import Firebase
class SignUpViewModel: NSObject {
    var signUpUsecase: SignUpProtocol?
    var emailValidationUsecase: EmailValidationProtocol?
    
    init(signUpUsecase: SignUpProtocol? = nil, emailValidationUsecase: EmailValidationProtocol? = nil) {
        self.signUpUsecase = signUpUsecase
        self.emailValidationUsecase = emailValidationUsecase
    }
    
    func createUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
       
        signUpUsecase?.createUser(email: email, password: password) { (firebaseResult, error) in
            completion(firebaseResult, error)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
       return emailValidationUsecase?.isValidEmail(email) ?? false
    }
}
