//
//  TutorialViewController.swift
//  GetOutfit
//
//  Created by Алёна Максимова on 02.04.2022.
//

import UIKit

class TutorialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createOccasionLabel.layer.borderWidth = 2
        homeLabel.layer.borderWidth = 2
        profileLabel.layer.borderWidth = 2
        createOccasionLabel.layer.cornerRadius = 10
        homeLabel.layer.cornerRadius = 10
        profileLabel.layer.cornerRadius = 10
        
        homeLabel.layer.borderColor = UIColor.init(named: "darkGreen")?.cgColor
        profileLabel.layer.borderColor = UIColor.init(named: "darkGreen")?.cgColor
        createOccasionLabel.layer.borderColor = UIColor.init(named: "darkGreen")?.cgColor
    }
    
    @IBOutlet var createOccasionLabel: UIView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var profileLabel: UILabel!


    
}
