//
//  confirmOrderViewController.swift
//  Pizza
//
//  Created by Eva on 01/07/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import UIKit

class confirmOrderViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var nameLabel: UILabel!
    
    var items: [String] = Array(anonymousUser.itemsInCart.keys)
    var quantity: [Int] = Array(anonymousUser.itemsInCart.values)
    
    
    
    
    
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
        
        if anonymousUser.userIsLoggedIn {
        nameLabel.text = "Hi \(loggedInUser.userName), kindly confirm your order"
        } else {
            nameLabel.text = "Hi \(Globals.shared.deliveryDetailToConfirmPage_Name), kindly confirm your order"
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick_ConfirmButton(_ sender: UIButton) {
        
        print("Order have been recorded. Delivery underway.")
        performSegue(withIdentifier: "confirmOrder", sender: self)
    }
    
    
}
