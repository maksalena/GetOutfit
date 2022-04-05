//
//  SizesViewController.swift
//  GetOutfit
//
//  Created by Алёна Максимова on 02.04.2022.
//

import UIKit
import Firebase

class UserInfViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        shirtSizePicker.delegate = self
        shirtSizePicker.dataSource = self
        pantsSizePicker.delegate = self
        pantsSizePicker.dataSource = self
        shoeSizePicker.delegate = self
        shoeSizePicker.dataSource = self
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        genderPicker.layer.cornerRadius = 8
        shirtSizePicker.layer.cornerRadius = 8
        pantsSizePicker.layer.cornerRadius = 8
        shoeSizePicker.layer.cornerRadius = 8
    }
    
    var shirtSizeSelected = ""
    var pantsSizeSelected = ""
    var shoeSizeSelected = ""
    var genderSelected = ""
    
    let db = Firestore.firestore()
    var pickerManager = PickerManager()

    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var shirtSizePicker: UIPickerView!
    @IBOutlet weak var pantsSizePicker: UIPickerView!
    @IBOutlet weak var shoeSizePicker: UIPickerView!
    
    @IBAction func finishRegistrationButtonPressed(_ sender: UIButton) {
        if let user = Auth.auth().currentUser?.email {
            db.collection("test").document(user).setData(["gender" : genderSelected, "shirtS": shirtSizeSelected, "pantsS": pantsSizeSelected, "shoeS": shoeSizeSelected]) { (error) in
                if let e = error {
                    print(e)
                } else {
                    print("Successfully saved")
                }
            }
        }
    }
    
    
}

extension UserInfViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == shirtSizePicker {
            return pickerManager.shirtSizes.count
        }
        if pickerView == pantsSizePicker {
            return pickerManager.pantsSize.count
        }
        if pickerView == shoeSizePicker {
            return pickerManager.shoeSizes.count
        } else {
            return pickerManager.gender.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == shirtSizePicker {
            return pickerManager.shirtSizes[row]
        }
        if pickerView == pantsSizePicker {
            return pickerManager.pantsSize[row]
        }
        if pickerView == shoeSizePicker {
            return pickerManager.shoeSizes[row]
        } else {
            return pickerManager.gender[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == shirtSizePicker {
            shirtSizeSelected = pickerManager.shirtSizes[row]
        }
        if pickerView == pantsSizePicker {
            pantsSizeSelected = pickerManager.pantsSize[row]
        }
        if pickerView == shoeSizePicker {
            shoeSizeSelected = pickerManager.shoeSizes[row]
        }
        if pickerView == genderPicker {
            genderSelected = pickerManager.gender[row]
        }
    }
}
