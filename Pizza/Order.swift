
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

let itemsDescription : [String:String] = [
"jollof rice":"The dish consists of rice, tomatoes and tomato paste, onions, salt, spices and chili peppers; optional ingredients can be added such as vegetables, meats, or fish. Due to the tomato paste and palm oil the dish is always red in color.",
"ofada rice":"Ofada rice is a name for a heritage variety of rice grown in south-west Nigeria. It is grown almost exclusively in Ogun State, a state in Southwestern Nigeria. It is named after the town Ofada in Ogun State. Ofada rices are mostly blends, and are not indigenous to Africa. It is often served with a vegetable stew.",
"fried rice":"Fried rice is a dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed with other ingredients like eggs and vegetables.",
"coconut rice":"A rice recipe prepared with coconut milk extract, is sure to wake up your taste buds.",
"tomato stew":"Tomato Stew is a simple stew used for cooking Nigerian Jollof Rice and Coconut Rice Recipes it can be used together with many various types of food.",
"banga stew":"Also known as 'Ofe Akwu' is a palm nut stew that is native to the Igbos in Nigeria. It is similar to the Efik's Banga Soup",
"vegetable stew":"It is a type of stew with alot of vegetable (pumpkin) in it. It is usually common among vegetarians.",
"sauce stew":"It is a highly proteinous dish with assorted meats, vegetables and spices. Some chef include irish potatoes as well.",
"eba":"Ẹbà is a Nigerian staple food eaten in West African subregion and beyond. It is made from dried grated cassava (manioc) flour, commonly known as garri. ... Gari is very rich in starch and carbohydrate. It is quite heavy as a meal and a staple food of the western Nigerians.",
"fufu":"Fufu (variants of the name include foofoo, fufuo, foufou) is a staple food, common in many countries in Africa. It is often made with cassava and green Plantain Flour. Other flours, such as semolina, maize flour or mashed plantains may take the place of cassava flour.",
"semo":"Semolina is the coarse, purified wheat middlings of durum wheat mainly used in making pasta ... Semolina is derived from the Italian word semola, meaning 'bran' . ... Broadly speaking, meal produced from grains other than wheat may also be referred to as semolina, e.g. rice semolina, or corn semolina",
"amala":"Àmàlà is a Nigerian food made out of yam and/or cassava flour. Yams are peeled , sliced, cleaned, dried and then blended into a flour, also called elubo.",
"lekki pizza":"A type of pizza peculiar to residents of Lekki area of Lagos state in Nigeria.",
"ikeja pizza":"A type of pizza peculiar to residents of Ikeja area of Lagos state in Nigeria",
"yaba pizza":"A type of pizza peculiar to residents of Yaba area of Lagos state in Nigeria",
"ojuelegba pizza":"A type of pizza peculiar to residents of Ojuelegba area of Lagos state in Nigeria",
"egusi soup":"Egusi seeds are the fat- and protein-rich seeds of certain cucurbitaceous (squash, melon, gourd) plants. Egusi soup is common and prevalent across Central Africa, and may be served atop rice, cooked vegetables or grilled meat, such as goat, chicken, beef or fish.",
"okro soup":"Okra soup is prepared using the edible green seed pods of the okra flowering plant as a primary ingredient. It is greenish in colour. Okra has a slippery feel when rubbed with the fingers. The edible green seed pods can also be used in stews",
"ogbono soup":"Similar to okro soup but usually prepare with Ogbono seeds, water, oil, leaf vegetables (bitterleaf and celosia), other vegetables, seasonings, meat.",
"eforiro soup":"Ẹ̀fọ́ riro is a Yorùbá cuisine prepared with vegetables and stockfish, palm oil, crayfish, pepper, locust bean and may also include meat and other ingredients.",
"coca-cola":"The most popular drink on earth after water",
"malt":"Malta is a lightly carbonated malt beverage, brewed from barley, hops, and water much like beer; corn and caramel color may also be added. ... It has a strong beer after smell from the breath an",
"bottled water":"Water is the most popular drink on earth. You probably knew this already.",
"beer":"The drinks that make men forget their sorrows for a while and some behave like kids in the process"
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
    
    func getItemDescription(itemName: String) -> String {
        
         if itemsDescription.index(forKey: itemName) != nil {
            return itemsDescription[itemName]!
        }
    
    return ""
    }
    
    

}


//class User: Order {
    
    
//}



