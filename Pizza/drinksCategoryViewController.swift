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
    
    var clickedItemName = ""
    var clickedItemPrice = ""
    var clickedItemDescrp = ""
    var clickedItemImage: UIImage = UIImage()
    
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
    
    @IBAction func onClick_foodItemImage(_ sender: UIButton) {
        let whichItemImageButtonClicked = sender.title(for: .normal)
        
        switch whichItemImageButtonClicked {
        case "itemDetailPageButtion1"?:
            clickedItemName = firstDrinkItemName.text!
            clickedItemImage = firstDrinkItemImage.image!
            clickedItemPrice = firstDrinkItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "drinksToDetails", sender: self)
            break
            
        case "itemDetailPageButtion2"?:
            clickedItemName = secondDrinkItemName.text!
            clickedItemImage = secondDrinkItemImage.image!
            clickedItemPrice = secondDrinkItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "drinksToDetails", sender: self)
            break
            
        case "itemDetailPageButtion3"?:
            clickedItemName = thirdDrinkItemName.text!
            clickedItemImage = thirdDrinkItemImage.image!
            clickedItemPrice = thirdDrinkItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "drinksToDetails", sender: self)
            break
            
        case "itemDetailPageButtion4"?:
            clickedItemName = fourthDrinkItemName.text!
            clickedItemImage = fourthDrinkItemImage.image!
            clickedItemPrice = fourthDrinkItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "drinksToDetails", sender: self)
            break
            
            
        default:
            break
        }
        
        
    }
    
    @IBAction func onClick_Cart(_ sender: UIButton) {
        
        performSegue(withIdentifier: "drinksToOrderSummary", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "drinksToDetails" {
            let DestViewController : detailsViewController = segue.destination as! detailsViewController
            DestViewController.itemName = clickedItemName
            DestViewController.image = clickedItemImage
            DestViewController.itemPrice = clickedItemPrice
            DestViewController.itemDescrip = clickedItemDescrp
            DestViewController.previousSegue = "detailsToDrinks"
        } else if segue.identifier == "drinksToOrderDetails" {
            
            let DestViewController : orderSummaryViewController = segue.destination as! orderSummaryViewController
            DestViewController.previousSegue = "orderSummaryToDrinks"
        }
    }
    
}
