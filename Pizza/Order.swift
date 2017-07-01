
import Foundation
import SQLite


//let menuList = ["Lekki pizza": 2500, "VI pizza": 3500]

//dictionary of menu items separated in categories with each menu item corresponding to its price tag
let menuList: [String:[String:Int]] = [
    "rice":["jollof rice":2000, "ofada rice": 2500, "fried rice":3000, "coconut rice":2800],
    "stew":["tomato stew":500, "banga stew":300, "vegetable stew": 200, "sauce stew":900],
    "swallow":["eba":350, "fufu":400, "semo":500, "amala":250],
    "pizza":["lekki pizza":2500, "ikeja pizza":2000, "yaba pizza":1500, "ojuelegba pizza":600],
    "soup":["egusi soup":300, "okro soup":350, "ogbono soup":150, "eforiro soup":600],
    "drinks":["coca-cola":100, "malt":150, "bottled water":50, "beer":250]
]

let menuListWithoutCategories : [String:Int] = [
    "jollof rice":2000, "ofada rice": 2500, "fried rice":3000, "coconut rice":2800,
    "tomato stew":500, "banga stew":300, "vegetable stew": 200, "sauce stew":900,
    "eba":350, "fufu":400, "semo":500, "amala":250,
    "lekki pizza":2500, "ikeja pizza":2000, "yaba pizza":1500, "ojuelegba pizza":600,
    "egusi soup":300, "okro soup":350, "ogbono soup":150, "eforiro soup":600,
    "coca-cola":100, "malt":150, "bottled water":50, "beer":250
]


//converts menuList to array of all menu items without price tags
let arrayOfMenuItem1 : [String] = Array(menuList["rice"]!.keys) + Array(menuList["stew"]!.keys)
let arrayOfMenuItem2 : [String] = Array(menuList["swallow"]!.keys) + Array(menuList["pizza"]!.keys)
let arrayOfMenuItem3 : [String] = Array(menuList["soup"]!.keys) + Array(menuList["drinks"]!.keys)

let arrayOfMenuItems : [String] = arrayOfMenuItem1 + arrayOfMenuItem2 + arrayOfMenuItem3



class Order {
    
    var itemsInCart : [String:Int] = [String:Int]()
    var lastOrder : [String:Int] = [String:Int]()
    var numberOfItems: Int = 0
    
    func addToCart(itemNameAndQuantity: Dictionary<String,Int>) -> Bool {
        
        let nameOfItem: String = Array(itemNameAndQuantity.keys)[0]
        for item in arrayOfMenuItems{ //checks if item to be added exists in menu items
            if item == nameOfItem { //confirms that item is in menuList
                if self.itemsInCart.index(forKey: nameOfItem) != nil { //checks if item to be removed exists in the users cart
                    self.itemsInCart.removeValue(forKey: nameOfItem)
                    self.itemsInCart[nameOfItem] = itemNameAndQuantity[nameOfItem]
                    return true
                }
                else {
                    self.itemsInCart[nameOfItem] = itemNameAndQuantity[nameOfItem]
                    return true
                }
                
            }
            
        }
        return false
    }
    
 /*   func displayItemsInCart(inputItemsInCart: [String:Int]) -> [String] {
        let arrayOfItemNames: [String] = Array(inputItemsInCart.keys)
        let arrayOfItemQuantity: [Int] = Array(inputItemsInCart.values)
        
        var convertQuantityToStringArray = arrayOfItemQuantity.map
        {
            String($0)
        }
        
        
        return
    }
*/
 
    func removeFromCart(itemName: String) -> Bool {
        if self.itemsInCart.index(forKey: itemName) != nil { //checks if item to be removed exists in the users cart
            self.itemsInCart.removeValue(forKey: itemName)
            return true
        }
        
        return false
    }
 
    func numberOfItemsInCart() -> Int {
        return self.itemsInCart.count
    }
 
    func totalOrder() -> Int {
        var totalCost : Int = 0
        //var itemQuantity : Int = 0
        
        for (itemName, quantity) in self.itemsInCart{
            let itemCost : Int = menuListWithoutCategories[itemName]! * quantity
            totalCost += itemCost
        }
        
        return totalCost
    }
    
    func confirmOrder() -> Bool {
        if self.itemsInCart.values.count != 0 && self.itemsInCart.keys.count != 0 {
            self.lastOrder = self.itemsInCart
            return true
        }
        return false
    }
    
    func searchItem(itemName: String) -> [String:Int] {
        var searchResult: [String:Int] = [String:Int]()
        
        for item in menuListWithoutCategories.keys {
            
            //Checks for an exact match
            if itemName == item {
                searchResult[item] = menuListWithoutCategories[item]
                return searchResult
            }
        }
        
        for item in menuList.keys {
        
            //checks for partial matc
            if item.range(of: itemName) != nil {
                searchResult = menuList[item]!
                return searchResult
            }
            
        }
        
        return searchResult
    }
    
    

}


//class User: Order {
    
    
//}



