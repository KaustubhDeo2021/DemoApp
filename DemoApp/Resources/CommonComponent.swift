//
//  CommonComponent.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit

class CommonComponent {

   static func showAlert(controller: UIViewController, message: String) {
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                print("unknown")
            }
        }))
        controller.present(alert, animated: true, completion: nil)
    }
}
