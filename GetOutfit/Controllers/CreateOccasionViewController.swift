//
//  CreateOccasionViewController.swift
//  GetOutfit
//
//  Created by Алёна Максимова on 06.04.2022.
//

import UIKit

class CreateOccasionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stylePicker.delegate = self
        colorPicker.delegate = self
        brendPicker.delegate = self
        budgetPicker.delegate = self
        genderPicker.delegate = self
        
        stylePicker.dataSource = self
        colorPicker.dataSource = self
        brendPicker.dataSource = self
        budgetPicker.dataSource = self
        genderPicker.dataSource = self

        stylePicker.layer.cornerRadius = 8
        colorPicker.layer.cornerRadius = 8
        brendPicker.layer.cornerRadius = 8
        budgetPicker.layer.cornerRadius = 8
        genderPicker.layer.cornerRadius = 8
        
        stylePicker.alpha = 0.55
        colorPicker.alpha = 0.55
        brendPicker.alpha = 0.55
        budgetPicker.alpha = 0.55
        genderPicker.alpha = 0.55
    }
    
    @IBOutlet weak var stylePicker: UIPickerView!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var brendPicker: UIPickerView!
    @IBOutlet weak var budgetPicker: UIPickerView!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    var pickerManager = PickerManager()
    var styleSelected = ""
    var colorSelected = ""
    var budgetSelected = ""
    var genderSelected = ""
    
    @IBAction func goToFavoritePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToFavorite", sender: self)
    }
    @IBAction func createNewOccasionPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "createNewOccasion", sender: self)
    }
    
}

extension CreateOccasionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == stylePicker {
            return pickerManager.style.count
        }
        if pickerView == colorPicker {
            return pickerManager.color.count
        }
        if pickerView == budgetPicker {
            return pickerManager.budget.count
        } else {
            return pickerManager.clothesGender.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == stylePicker {
            return pickerManager.style[row]
        }
        if pickerView == colorPicker {
            return pickerManager.color[row]
        }
        if pickerView == budgetPicker {
            return pickerManager.budget[row]
        } else {
            return pickerManager.clothesGender[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == stylePicker {
             styleSelected = pickerManager.style[row]
        }
        if pickerView == colorPicker {
            colorSelected = pickerManager.color[row]
        }
        if pickerView == budgetPicker {
            budgetSelected = pickerManager.budget[row]
        }
        if pickerView == genderPicker {
            genderSelected = pickerManager.clothesGender[row]
        }
    }
    
    
}
