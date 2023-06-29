//
//  LoginViewModel.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit
import Firebase
class LoginViewModel: NSObject {

    var loginUsecase: LoginProtocol?
    var emailValidationUsecase: EmailValidationUsecase?
    
    init(loginUsecase: LoginProtocol? = nil, emailValidationUsecase: EmailValidationUsecase? = nil) {
        self.loginUsecase = loginUsecase
        self.emailValidationUsecase = emailValidationUsecase
    }
    
    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
        
        loginUsecase?.signIn(email: email, password: password) { firebaseResult, error in
            completion(firebaseResult, error)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
       return emailValidationUsecase?.isValidEmail(email) ?? false
    }
}
