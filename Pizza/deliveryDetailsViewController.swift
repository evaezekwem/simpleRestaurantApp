//
//  deliveryDetailsViewController.swift
//  Pizza
//
//  Created by Eva on 01/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class deliveryDetailsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var deliveryAddressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick_Proceed(_ sender: UIButton) {
        
        let phoneNo = phoneTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if nameTextField.text == "Name:" || nameTextField.text == "" {
            messageLabel.text = "Please enter a name"
        } else if deliveryAddressTextField.text == "Delivery Address:" || deliveryAddressTextField.text == "" {
            messageLabel.text = "Please enter a delivery address"
            
        } else if phoneNo.isEmpty || phoneNo == "" || !isValidPhoneNo(userPhone: phoneNo) {
            messageLabel.text = "Please enter a valid phone number"
            
        } else if isValidPhoneNo(userPhone: phoneNo) {
         messageLabel.text = ""
            Globals.shared.deliveryDetailToConfirmPage_Name = nameTextField.text!
         performSegue(withIdentifier: "deliveryDetailsToConfirmOrder", sender: self)
         
        }
        
        
    }
    
    
    func isValidPhoneNo(userPhone: String) -> Bool {
        let phoneRegEx = "^\\d{11}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegEx).evaluate(with: userPhone)
        
    }
    

}
