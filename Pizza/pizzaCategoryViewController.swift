//
//  pizzaCategoryViewController.swift
//  Pizza
//
//  Created by Eva on 27/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class pizzaCategoryViewController: UIViewController {

    @IBOutlet weak var firstPizzaItemName: UILabel!
    @IBOutlet weak var firstPizzaItemImage: UIImageView!
    @IBOutlet weak var firstPizzaItemPrice: UILabel!
    
    @IBOutlet weak var secondPizzaItemName: UILabel!
    @IBOutlet weak var secondPizzaItemImage: UIImageView!
    @IBOutlet weak var secondPizzaItemPrice: UILabel!
    
    @IBOutlet weak var thirdPizzaItemName: UILabel!
    @IBOutlet weak var thirdPizzaItemImage: UIImageView!
    @IBOutlet weak var thirdPizzaItemPrice: UILabel!
    
    @IBOutlet weak var fourthPizzaItemName: UILabel!
    @IBOutlet weak var fourthPizzaItemImage: UIImageView!
    @IBOutlet weak var fourthPizzaItemPrice: UILabel!
    
    @IBOutlet weak var totalItemsInCart: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Assigning values
        firstPizzaItemName.text = "Lekki Pizza"
        firstPizzaItemImage.image = #imageLiteral(resourceName: "pizza1_ojotapizza")
        firstPizzaItemPrice.text = "N2500"
        
        secondPizzaItemName.text = "Yaba Pizza"
        secondPizzaItemImage.image = #imageLiteral(resourceName: "pizza2_chicago")
        secondPizzaItemPrice.text = "N1500"
        
        thirdPizzaItemName.text = "Ikeja Pizza"
        thirdPizzaItemImage.image = #imageLiteral(resourceName: "pizza3_newyork")
        thirdPizzaItemPrice.text = "N2000"
        
        fourthPizzaItemName.text = "Ojuelegba Pizza"
        fourthPizzaItemImage.image = #imageLiteral(resourceName: "pizza4_greek")
        fourthPizzaItemPrice.text = "N600"
        
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
            let item = firstPizzaItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton2"?:
            let item = secondPizzaItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton3"?:
            let item = thirdPizzaItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton4"?:
            let item = fourthPizzaItemName.text!.lowercased()
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
