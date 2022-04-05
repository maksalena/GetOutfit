//
//  LogInViewController.swift
//  GetOutfit
//
//  Created by Алёна Максимова on 02.04.2022.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.text = ""
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func logInBottonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.text = e.localizedDescription
                } else {
                    self.performSegue(withIdentifier: "goToOccasions", sender: self)
                }
              
            }
        }
        
    }
    

}
