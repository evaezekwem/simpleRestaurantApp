//
//  stewViewController.swift
//  Pizza
//
//  Created by Eva on 26/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class stewViewController: UIViewController {

    @IBOutlet weak var firstStewItemName: UILabel!
    @IBOutlet weak var firstStewItemImage: UIImageView!
    @IBOutlet weak var firstStewItemPrice: UILabel!
   
    
    @IBOutlet weak var secondStewItemName: UILabel!
    @IBOutlet weak var secondStewItemImage: UIImageView!
    @IBOutlet weak var secondStewItemPrice: UILabel!

    
    @IBOutlet weak var thirdStewItemName: UILabel!
    @IBOutlet weak var thirdStewItemImage: UIImageView!
    @IBOutlet weak var thirdStewItemPrice: UILabel!
    
    
    @IBOutlet weak var fourthStewItemName: UILabel!
    @IBOutlet weak var fourthStewItemImage: UIImageView!
    @IBOutlet weak var fourthStewItemPrice: UILabel!
    
    
    @IBOutlet weak var totalItemsInCart: UILabel!
    
    var clickedItemName = ""
    var clickedItemPrice = ""
    var clickedItemDescrp = ""
    var clickedItemImage: UIImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Assigning values
        
        firstStewItemName.text = "Tomato Stew"
        firstStewItemImage.image = #imageLiteral(resourceName: "tomatoe_stew")
        firstStewItemPrice.text = "N500"
        
        secondStewItemName.text = "Banga Stew"
        secondStewItemImage.image = #imageLiteral(resourceName: "banga_stew")
        secondStewItemPrice.text = "N300"
        
        thirdStewItemName.text = "Sauce Stew"
        thirdStewItemImage.image = #imageLiteral(resourceName: "sauce_stew")
        thirdStewItemPrice.text = "N900"
        
        fourthStewItemName.text = "Vegetable Stew"
        fourthStewItemImage.image = #imageLiteral(resourceName: "vegetable_stew")
        fourthStewItemPrice.text = "N200"
        
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
            let item = firstStewItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton2"?:
            let item = secondStewItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton3"?:
            let item = thirdStewItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton4"?:
            let item = fourthStewItemName.text!.lowercased()
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
            clickedItemName = firstStewItemName.text!
            clickedItemImage = firstStewItemImage.image!
            clickedItemPrice = firstStewItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "stewToDetails", sender: self)
            break
            
        case "itemDetailPageButtion2"?:
            clickedItemName = secondStewItemName.text!
            clickedItemImage = secondStewItemImage.image!
            clickedItemPrice = secondStewItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "stewToDetails", sender: self)
            break
            
        case "itemDetailPageButtion3"?:
            clickedItemName = thirdStewItemName.text!
            clickedItemImage = thirdStewItemImage.image!
            clickedItemPrice = thirdStewItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "stewToDetails", sender: self)
            break
            
        case "itemDetailPageButtion4"?:
            clickedItemName = fourthStewItemName.text!
            clickedItemImage = fourthStewItemImage.image!
            clickedItemPrice = fourthStewItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "stewToDetails", sender: self)
            break
            
            
        default:
            break
        }
        
        
        
    }
    
    @IBAction func onClick_Cart(_ sender: UIButton) {
        performSegue(withIdentifier: "stewToOrderSummary", sender: self)
    }
    
    @IBAction func onClick_Search(_ sender: UIButton) {
        performSegue(withIdentifier: "stewToSearch", sender: self)
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "stewToDetails" {
            
            let DestViewController : detailsViewController = segue.destination as! detailsViewController
            DestViewController.itemName = clickedItemName
            DestViewController.image = clickedItemImage
            DestViewController.itemPrice = clickedItemPrice
            DestViewController.itemDescrip = clickedItemDescrp
            DestViewController.previousSegue = "detailsToStew"
            
        } else if segue.identifier == "stewToOrderSummary" {
   
            let DestViewController : orderSummaryViewController = segue.destination as! orderSummaryViewController
            DestViewController.previousSegue = "orderSummaryToStew"
            
        } else if segue.identifier == "stewToSearch" {
            
            let DestViewController : searchViewController = segue.destination as! searchViewController
            DestViewController.previousSegue = "searchToStew"
            
        }

    }

}
