//
//  drinksViewController.swift
//  Pizza
//
//  Created by Eva on 27/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class drinksViewController: UIViewController {

    @IBOutlet weak var firstDrinkItemName: UILabel!
    @IBOutlet weak var firstDrinkItemImage: UIImageView!
    @IBOutlet weak var firstDrinkItemPrice: UILabel!
    
    @IBOutlet weak var secondDrinkItemName: UILabel!
    @IBOutlet weak var secondDrinkItemImage: UIImageView!
    @IBOutlet weak var secondDrinkItemPrice: UILabel!
    
    @IBOutlet weak var thirdDrinkItemName: UILabel!
    @IBOutlet weak var thirdDrinkItemImage: UIImageView!
    @IBOutlet weak var thirdDrinkItemPrice: UILabel!
    
    @IBOutlet weak var fourthDrinkItemName: UILabel!
    @IBOutlet weak var fourthDrinkItemImage: UIImageView!
    @IBOutlet weak var fourthDrinkItemPrice: UILabel!
    
    @IBOutlet weak var totalItemsInCart: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Assigning values
        firstDrinkItemName.text = "Coca-cola"
        firstDrinkItemImage.image = #imageLiteral(resourceName: "coke")
        firstDrinkItemPrice.text = "N100"
        
        secondDrinkItemName.text = "Beer"
        secondDrinkItemImage.image = #imageLiteral(resourceName: "beer")
        secondDrinkItemPrice.text = "N250"
        
        thirdDrinkItemName.text = "Malt"
        thirdDrinkItemImage.image = #imageLiteral(resourceName: "malt")
        thirdDrinkItemPrice.text = "N150"
        
        fourthDrinkItemName.text = "Bottled Water"
        fourthDrinkItemImage.image = #imageLiteral(resourceName: "bottled_water")
        fourthDrinkItemPrice.text = "N50"
        
        totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    @IBAction func onClick_AddToCartButton(_ sender: UIButton) {
        
        
        let whichAddToCartButtonClicked = sender.title(for: .normal)
        switch whichAddToCartButtonClicked {
        case "addToCartButton1"?:
            let item = firstDrinkItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton2"?:
            let item = secondDrinkItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton3"?:
            let item = thirdDrinkItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton4"?:
            let item = fourthDrinkItemName.text!.lowercased()
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
