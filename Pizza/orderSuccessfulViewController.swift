//
//  orderSuccessfulViewController.swift
//  Pizza
//
//  Created by Eva on 01/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class orderSuccessfulViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if !loggedInUser.userName.isEmpty {
        messageLabel.text = "\(anonymousUser.userName), Your food is on the way."
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick_BackToMenuButton(_ sender: UIButton) {
        
        anonymousUser.itemsInCart = [String:Int]()
        loggedInUser.itemsInCart = [String:Int]()
        
        performSegue(withIdentifier: "confirmOrderToMenu", sender: self)
        
    }

}
