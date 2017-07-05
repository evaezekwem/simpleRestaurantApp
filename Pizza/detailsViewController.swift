//
//  detailsViewController.swift
//  Pizza
//
//  Created by Eva on 03/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemDescriptionTextView: UITextView!
   
    @IBOutlet weak var totalItemsInCart: UILabel!
    
    var itemName: String = String()
    var image: UIImage = UIImage()
    var itemPrice: String = String()
    var itemDescrip: String = String()

    var previousSegue: String = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
        
        itemNameLabel.text = itemName
        itemImage.image = image
        itemPriceLabel.text = itemPrice
        itemDescriptionTextView.text = itemDescrip
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick_AddToCartButton(_ sender: UIButton) {
        
        _ = anonymousUser.addToCart(itemNameAndQuantity: [itemName.lowercased():1])
        
        totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
    }


    @IBAction func onClick_BackButton(_ sender: UIButton) {
        performSegue(withIdentifier: previousSegue, sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       // let DestViewController : detailsViewController = segue.destination as! detailsViewController
        
        //if segue.identifier == "detailsToRice" {
           
        //}
    }

}