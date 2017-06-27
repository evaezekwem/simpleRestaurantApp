//
//  swallowViewController.swift
//  Pizza
//
//  Created by Eva on 27/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class swallowViewController: UIViewController {

    
    @IBOutlet weak var firstSwallowItemName: UILabel!
    @IBOutlet weak var firstSwallowItemImage: UIImageView!
    @IBOutlet weak var firstSwallowItemPrice: UILabel!
    
    @IBOutlet weak var secondSwallowItemName: UILabel!
    @IBOutlet weak var secondSwallowItemImage: UIImageView!
    @IBOutlet weak var secondSwallowItemPrice: UILabel!
    
    @IBOutlet weak var thirdSwallowItemName: UILabel!
    @IBOutlet weak var thirdSwallowItemImage: UIImageView!
    @IBOutlet weak var thirdSwallowItemPrice: UILabel!
    
    @IBOutlet weak var fourthSwallowItemName: UILabel!
    @IBOutlet weak var fourthSwallowItemImage: UIImageView!
    @IBOutlet weak var fourthSwallowItemPrice: UILabel!
    
    @IBOutlet weak var totalItemsInCart: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Assigning values
        
        firstSwallowItemName.text = "Eba"
        firstSwallowItemImage.image = #imageLiteral(resourceName: "eba")
        firstSwallowItemPrice.text = "N350"
        
        secondSwallowItemName.text = "Fufu"
        secondSwallowItemImage.image = #imageLiteral(resourceName: "fufu")
        secondSwallowItemPrice.text = "N400"
        
        thirdSwallowItemName.text = "Semo"
        thirdSwallowItemImage.image = #imageLiteral(resourceName: "semo")
        thirdSwallowItemPrice.text = "N500"
        
        fourthSwallowItemName.text = "Amala"
        fourthSwallowItemImage.image = #imageLiteral(resourceName: "amala")
        fourthSwallowItemPrice.text = "N250"
        
        totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onClick_addToCartButton(_ sender: UIButton) {
        let whichAddToCartButtonClicked = sender.title(for: .normal)
        switch whichAddToCartButtonClicked {
        case "addToCartButton1"?:
            let item = firstSwallowItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton2"?:
            let item = secondSwallowItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton3"?:
            let item = thirdSwallowItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton4"?:
            let item = fourthSwallowItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        default:
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            
        }
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
