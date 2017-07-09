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

    var clickedItemName = ""
    var clickedItemPrice = ""
    var clickedItemDescrp = ""
    var clickedItemImage: UIImage = UIImage()

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
    
    @IBAction func onClick_FoodItemImage(_ sender: UIButton) {
        
        let whichItemImageButtonClicked = sender.title(for: .normal)
        
        switch whichItemImageButtonClicked {
        case "itemDetailPageButtion1"?:
            clickedItemName = firstRiceItemName.text!
            clickedItemImage = firstRiceItemImage.image!
            clickedItemPrice = firstRiceItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "riceToDetails", sender: self)
            break
            
        case "itemDetailPageButtion2"?:
            clickedItemName = secondRiceItemName.text!
            clickedItemImage = secondRiceItemImage.image!
            clickedItemPrice = secondRiceItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "riceToDetails", sender: self)
            break

        case "itemDetailPageButtion3"?:
            clickedItemName = thirdRiceItemName.text!
            clickedItemImage = thirdRiceItemImage.image!
            clickedItemPrice = thirdRiceItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "riceToDetails", sender: self)
            break

        case "itemDetailPageButtion4"?:
            clickedItemName = fourthRiceItemName.text!
            clickedItemImage = fourthRiceItemImage.image!
            clickedItemPrice = fourthRiceItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "riceToDetails", sender: self)
            break

            
        default:
            break
        }
        
        
        
    }
    
    @IBAction func onClick_Cart(_ sender: UIButton) {
        performSegue(withIdentifier: "riceToOrderSummary", sender: self)
    }
    
    
    @IBAction func onClick_Search(_ sender: UIButton) {
        performSegue(withIdentifier: "riceToSearch", sender: self)
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "riceToDetails" {
            let DestViewController : detailsViewController = segue.destination as! detailsViewController
            DestViewController.itemName = clickedItemName
            DestViewController.image = clickedItemImage
            DestViewController.itemPrice = clickedItemPrice
            DestViewController.itemDescrip = clickedItemDescrp
            DestViewController.previousSegue = "detailsToRice"
        } else if segue.identifier == "riceToOrderSummary" {
            let DestViewController : orderSummaryViewController = segue.destination as! orderSummaryViewController
            DestViewController.previousSegue = "orderSummaryToRice"
        } else if segue.identifier == "riceToSearch" {
            let DestViewController : searchViewController = segue.destination as! searchViewController
            DestViewController.previousSegue = "searchToRice"
        }
    }
 
}
