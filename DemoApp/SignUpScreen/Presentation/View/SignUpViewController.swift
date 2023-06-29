//
//  SignUpViewController.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 25/06/23.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var signUpViewModel = SignUpViewModel(signUpUsecase: SignUpUsecase(), emailValidationUsecase: EmailValidationUsecase())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - signUpButtonTapped
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        self.view.endEditing(true)
        
        guard let email = emailTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else{ return }
        guard let password = passwordTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else{ return }
        
        guard signUpViewModel.isValidEmail(email) == true else {
            
            CommonComponent.showAlert(controller: self, message: Constant.validEmail)
            return
        }
        
        guard password.count > 3 else {
            
            CommonComponent.showAlert(controller: self, message: Constant.validPassword)
            return
        }
        
        activityIndicator.startAnimating()
        signUpViewModel.createUser(email: email, password: password) {[weak self] (firebaseResult, error) in
            
            self?.activityIndicator.stopAnimating()
            
            if error != nil {
                guard let weakSelf = self else {
                    return
                }
                CommonComponent.showAlert(controller: weakSelf, message: Constant.wentWrong)
            } else {
                self?.performSegue(withIdentifier: Constant.segueIdentifier, sender: self)
            }
        }
    }
}
