//
//  IntroViewController.swift
//  GetOutfit
//
//  Created by Алёна Максимова on 02.04.2022.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "GET OUTFIT"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.12 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
    }

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToEnter", sender: self)
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegistration", sender: self)
    }
    
    
    
}

