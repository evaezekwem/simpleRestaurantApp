//
//  orderSummaryViewController.swift
//  Pizza
//
//  Created by Eva on 30/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class orderSummaryViewController: UIViewController, UITableViewDataSource {

    var items: [String] = Array(anonymousUser.itemsInCart.keys)
    var quantity: [Int] = Array(anonymousUser.itemsInCart.values)
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var totalToDisplay: [String:Int] = anonymousUser.itemsInCart
        let totalOrder = anonymousUser.totalOrder()
        totalToDisplay["Total:"] = totalOrder
        items.append("Total")
        quantity.append(totalOrder)
        
        
        return totalToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //var items: [String] = Array(anonymousUser.itemsInCart.keys)
        //var quantity: [Int] = Array(anonymousUser.itemsInCart.values)
        
        if quantity[indexPath.row] != anonymousUser.totalOrder() {
         cell.textLabel?.text = "\(quantity[indexPath.row]) x \(items[indexPath.row])"
        } else if quantity[indexPath.row] == anonymousUser.totalOrder() {
            cell.textLabel?.text = "Total: N\(anonymousUser.totalOrder())"
        }
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick_ProceedButton(_ sender: UIButton) {
        
        if anonymousUser.itemsInCart.count > 0 {
            messageLabel.text = ""
            performSegue(withIdentifier: "orderSummaryToDeliveryDetails", sender: self)
        } else {
            messageLabel.text = "Cart is empty"
        }
    }

   
}
