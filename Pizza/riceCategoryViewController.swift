//
//  riceCategoryViewController.swift
//  Pizza
//
//  Created by Eva on 26/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class riceCategoryViewController: UIViewController {

    
    @IBOutlet weak var firstRiceItemName: UILabel!
    @IBOutlet weak var firstRiceItemImage: UIImageView!
    @IBOutlet weak var firstRiceItemPrice: UILabel!
    
    @IBOutlet weak var secondRiceItemName: UILabel!
    @IBOutlet weak var secondRiceItemImage: UIImageView!
    @IBOutlet weak var secondRiceItemPrice: UILabel!
    
    @IBOutlet weak var thirdRiceItemName: UILabel!
    @IBOutlet weak var thirdRiceItemImage: UIImageView!
    @IBOutlet weak var thirdRiceItemPrice: UILabel!
    
    @IBOutlet weak var fourthRiceItemName: UILabel!
    @IBOutlet weak var fourthRiceItemImage: UIImageView!
    @IBOutlet weak var fourthRiceItemPrice: UILabel!


    @IBOutlet weak var totalItemsInCart: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assigning Name of menu items
        firstRiceItemName.text = "Jollof Rice"
        firstRiceItemImage.image = #imageLiteral(resourceName: "jollof_rice")
        firstRiceItemPrice.text = "N2000"
        
        secondRiceItemName.text = "Fried Rice"
        secondRiceItemImage.image = #imageLiteral(resourceName: "fried_rice")
        secondRiceItemPrice.text = "N3000"
        
        thirdRiceItemName.text = "Coconut Rice"
        thirdRiceItemImage.image = #imageLiteral(resourceName: "coconut_rice")
        thirdRiceItemPrice.text = "N2800"
        
        fourthRiceItemName.text = "Ofada Rice"
        fourthRiceItemImage.image = #imageLiteral(resourceName: "ofada_rice")
        fourthRiceItemPrice.text = "N2500"
        
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
            let item = firstRiceItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
           totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
        
        case "addToCartButton2"?:
            let item = secondRiceItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton3"?:
            let item = thirdRiceItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton4"?:
            let item = fourthRiceItemName.text!.lowercased()
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
