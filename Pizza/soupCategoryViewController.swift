//
//  soupCategoryViewController.swift
//  Pizza
//
//  Created by Eva on 27/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class soupCategoryViewController: UIViewController {

    @IBOutlet weak var firstSoupItemName: UILabel!
    @IBOutlet weak var firstSoupItemImage: UIImageView!
    @IBOutlet weak var firstSoupItemPrice: UILabel!
    
    @IBOutlet weak var secondSoupItemName: UILabel!
    @IBOutlet weak var secondSoupItemImage: UIImageView!
    @IBOutlet weak var secondSoupItemPrice: UILabel!
    

    @IBOutlet weak var thirdSoupItemName: UILabel!
    @IBOutlet weak var thirdSoupItemImage: UIImageView!
    @IBOutlet weak var thirdSoupItemPrice: UILabel!
    
    @IBOutlet weak var fourthSoupItemName: UILabel!
    @IBOutlet weak var fourthSoupItemImage: UIImageView!
    @IBOutlet weak var fourthSoupItemPrice: UILabel!
  
    @IBOutlet weak var totalItemsInCart: UILabel!
    
    
    var clickedItemName = ""
    var clickedItemPrice = ""
    var clickedItemDescrp = ""
    var clickedItemImage: UIImage = UIImage()
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Assigning Values
        firstSoupItemName.text = "Egusi Soup"
        firstSoupItemImage.image = #imageLiteral(resourceName: "egusi_soup")
        firstSoupItemPrice.text = "N300"
        
        secondSoupItemName.text = "Okro Soup"
        secondSoupItemImage.image = #imageLiteral(resourceName: "okro_soup")
        secondSoupItemPrice.text = "N350"
        
        thirdSoupItemName.text = "Ogbono Soup"
        thirdSoupItemImage.image = #imageLiteral(resourceName: "ogbono_soup2")
        thirdSoupItemPrice.text = "N150"
        
        fourthSoupItemName.text = "Eforiro Soup"
        fourthSoupItemImage.image = #imageLiteral(resourceName: "eforiro_soup")
        fourthSoupItemPrice.text = "N600"
        
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
            let item = firstSoupItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton2"?:
            let item = secondSoupItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton3"?:
            let item = thirdSoupItemName.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton4"?:
            let item = fourthSoupItemName.text!.lowercased()
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
            clickedItemName = firstSoupItemName.text!
            clickedItemImage = firstSoupItemImage.image!
            clickedItemPrice = firstSoupItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "soupToDetails", sender: self)
            break
            
        case "itemDetailPageButtion2"?:
            clickedItemName = secondSoupItemName.text!
            clickedItemImage = secondSoupItemImage.image!
            clickedItemPrice = secondSoupItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "soupToDetails", sender: self)
            break
            
        case "itemDetailPageButtion3"?:
            clickedItemName = thirdSoupItemName.text!
            clickedItemImage = thirdSoupItemImage.image!
            clickedItemPrice = thirdSoupItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "soupToDetails", sender: self)
            break
            
        case "itemDetailPageButtion4"?:
            clickedItemName = fourthSoupItemName.text!
            clickedItemImage = fourthSoupItemImage.image!
            clickedItemPrice = fourthSoupItemPrice.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "soupToDetails", sender: self)
            break
            
            
        default:
            break
        }
        
        
    }
    
    @IBAction func onClick_Cart(_ sender: UIButton) {
        
        performSegue(withIdentifier: "soupToOrderSummary", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "soupToDetails" {
            
            let DestViewController : detailsViewController = segue.destination as! detailsViewController
            DestViewController.itemName = clickedItemName
            DestViewController.image = clickedItemImage
            DestViewController.itemPrice = clickedItemPrice
            DestViewController.itemDescrip = clickedItemDescrp
            DestViewController.previousSegue = "detailsToSoup"
            
        } else if segue.identifier == "soupToOrderDetails" {
            
            let DestViewController : orderSummaryViewController = segue.destination as! orderSummaryViewController
            DestViewController.previousSegue = "orderSummaryToSoup"
        }
    }
    
}
