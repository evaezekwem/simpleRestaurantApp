//
//  registrationViewController.swift
//  Pizza
//
//  Created by Eva on 27/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class registrationViewController: UIViewController {

    
    @IBOutlet weak var messageView: UITextView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var deliveryAddress: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        name.delegate = self
        email.delegate = self
        password.delegate = self
        deliveryAddress.delegate = self
        phone.delegate = self
        
        messageView.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onClick_Register(_ sender: UIButton) {
        let finalName = name.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let finalEmail = email.text!.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let finalDeliveryAddress = deliveryAddress.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let  phoneNo = phone.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        
        
        if finalName.isEmpty || finalName == "Name:" {
            
            messageView.text = "Please enter a valid name"
           
        
        } else if finalEmail.isEmpty || finalEmail == "email:" || !isValidEmail(userEmail: finalEmail) {
        
            messageView.text = "Please enter a valid email"
            
        } else if (password.text?.isEmpty)! || password.text == "Password:" {
            
            messageView.text = "Please enter your password"
            
        } else if finalDeliveryAddress.isEmpty || finalDeliveryAddress == "Delivery Address:" {
            
            messageView.text = "Please enter a valid address"
            
        } else if phoneNo.isEmpty || phoneNo == "070345345434" || !isValidPhoneNo(userPhone: phoneNo){
            
            messageView.text = "Please enter a valid phone number"
            
        } else if anonymousUser.checkUser(inputEmail: finalEmail) == finalEmail{
            
          messageView.text = "Email already exist"
            
        } else if anonymousUser.checkUser(inputEmail: finalEmail) != finalEmail{
            messageView.text = ""
            let finalPhone: Int64 = (Int64(phoneNo))!
            let finalPassword = password.text
            
            let status = anonymousUser.registerUser(inputName: finalName, inputEmail: finalEmail, inputPassword: finalPassword!, inputPhone: finalPhone, inputDeliveryAddress: finalDeliveryAddress)
            if status && !finalName.isEmpty && finalName != "Name:" && !finalEmail.isEmpty && finalEmail != "email:" && isValidEmail(userEmail: finalEmail) && !(password.text?.isEmpty)! && password.text != "Password:" && !finalDeliveryAddress.isEmpty && finalDeliveryAddress != "Delivery Address:" && !phoneNo.isEmpty && phoneNo != "070345345434" && isValidPhoneNo(userPhone: phoneNo) {
            
                Globals.shared.registrationToLogin_Email = finalEmail
                Globals.shared.registrationToLogin_Pass = password.text!
                
                performSegue(withIdentifier: "registrationToLogin", sender: self)
                
                /*
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "confirmOrder")
                self.present(controller, animated: true, completion: nil)
            */
            }
            
            
        }
        
    }
    
    func isValidEmail(userEmail: String) -> Bool {
        let emailRegEx = "[A-Za-z0-9.%+-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: userEmail)
    }
    
    func isValidPhoneNo(userPhone: String) -> Bool {
        let phoneRegEx = "^\\d{11}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegEx).evaluate(with: userPhone)
        
    }
    
    

}

extension registrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
