//
//  LoginViewController.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 25/06/23.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var loginViewModel = LoginViewModel(loginUsecase: LoginUsecase(), emailValidationUsecase: EmailValidationUsecase())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - loginButtonTapped
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        self.view.endEditing(true)
        
        guard let email = emailTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else{ return }
        guard let password = passwordTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else{ return }
        
        guard loginViewModel.isValidEmail(email) == true else {
            
            CommonComponent.showAlert(controller: self, message: Constant.validEmail)
            return
        }
        
        guard password.count > 3 else {
            
            CommonComponent.showAlert(controller: self, message: Constant.validPassword)
            return
        }
        
        activityIndicator.startAnimating()
        loginViewModel.signIn(email: email, password: password) {[weak self] firebaseResult, error in
            
            self?.activityIndicator.stopAnimating()
            
            if error != nil {
                print("error")
                guard let weakSelf = self else {
                    return
                }
                CommonComponent.showAlert(controller: weakSelf, message: Constant.validCredentials)
            } else {
                self?.performSegue(withIdentifier: Constant.segueIdentifier, sender: self)
            }
        }
    }
    
    @IBAction func logoutUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
}
