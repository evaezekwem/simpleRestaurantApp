//
//  loginViewController.swift
//  Pizza
//
//  Created by Eva on 28/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    

    
    @IBAction func onClick_login(_ sender: UIButton) {
        
        let finalEmail = emailTextField.text!.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if finalEmail.isEmpty || finalEmail == "email:" || !isValidEmail(userEmail: finalEmail){
            messageLabel.text = "Please enter a valid email"
        }
        else{
            
            messageLabel.text = ""
            
            if anonymousUser.loginUser(inputEmail: finalEmail, inputPassword: passwordTextField.text!) == true{
                
                performSegue(withIdentifier: "loginToConfirmOrder", sender: self)
                
            }
            else{
                messageLabel.text = "Incorrect email or password"
            }
        }
     
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.text = Globals.shared.registrationToLogin_Email
        passwordTextField.text = Globals.shared.registrationToLogin_Pass
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    func isValidEmail(userEmail: String) -> Bool {
        let emailRegEx = "[A-Za-z0-9.%+-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: userEmail)
    }

}
