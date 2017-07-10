
import UIKit

class searchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var firstItemNameLabel: UILabel!
    @IBOutlet weak var firstItemImage: UIImageView!
    @IBOutlet weak var firstItemPriceLabel: UILabel!
    @IBOutlet var firstView: UIView!
  
    
    @IBOutlet weak var secondItemNameLabel: UILabel!
    @IBOutlet weak var secondItemImage: UIImageView!
    @IBOutlet weak var secondItemPriceLabel: UILabel!
    @IBOutlet var secondView: UIView!
    
    @IBOutlet weak var thirdItemNameLabel: UILabel!
    @IBOutlet weak var thirdItemImage: UIImageView!
    @IBOutlet weak var thirdItemPriceLabel: UILabel!
    @IBOutlet var thirdView: UIView!
    
    
    @IBOutlet weak var fourthItemNameLabel: UILabel!
    @IBOutlet weak var fourthItemImage: UIImageView!
    @IBOutlet weak var fourthItemPriceLabel: UILabel!
    @IBOutlet var fourthView: UIView!
    
    
    @IBOutlet weak var totalItemsInCart: UILabel!
    
    var clickedItemName = ""
    var clickedItemPrice = ""
    var clickedItemDescrp = ""
    var clickedItemImage: UIImage = UIImage()
    
    var previousSegue = "searchToMenu"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
        
        firstView.isHidden = true
        secondView.isHidden = true
        thirdView.isHidden = true
        fourthView.isHidden = true
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //Function is called with each key stroke typed on the search bar
    @IBAction func textFieldChanged(_ sender: UITextField) {
        let userInput : String = searchTextField.text!
        let searchResult = anonymousUser.searchItem(itemName: userInput)
        let itemNames : [String] = Array(searchResult.keys)
        let itemIndex : Int = searchResult.count - 1
        
        var itemName = ""
        
        
        if searchResult.count == 0 || userInput.isEmpty {
            
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
            fourthView.isHidden = true
        
        } else if searchResult.count == 1 {
            
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
            fourthView.isHidden = true
            
            
            itemName = itemNames[itemIndex]
            firstItemNameLabel.text = itemName.capitalized
            firstItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            firstItemImage.image = menuListWithImages[itemName]
        
        } else if searchResult.count == 2 {
            
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = true
            fourthView.isHidden = true
            
            itemName = itemNames[searchResult.count - 2]
            firstItemNameLabel.text = itemName.capitalized
            firstItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            firstItemImage.image = menuListWithImages[itemName]
            
            itemName = itemNames[searchResult.count - 1]
            secondItemNameLabel.text = itemName.capitalized
            secondItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            secondItemImage.image = menuListWithImages[itemName]
            
        } else if searchResult.count == 3 {
            
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = false
            fourthView.isHidden = true
            
            itemName = itemNames[searchResult.count - 3]
            firstItemNameLabel.text = itemName.capitalized
            firstItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            firstItemImage.image = menuListWithImages[itemName]
            
            itemName = itemNames[searchResult.count - 2]
            secondItemNameLabel.text = itemName.capitalized
            secondItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            secondItemImage.image = menuListWithImages[itemName]
            
            itemName = itemNames[searchResult.count - 1]
            thirdItemNameLabel.text = itemName.capitalized
            thirdItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            thirdItemImage.image = menuListWithImages[itemName]

            
        } else if searchResult.count >= 4 {
            
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = false
            fourthView.isHidden = false
            
            itemName = itemNames[searchResult.count - 4]
            firstItemNameLabel.text = itemName.capitalized
            firstItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            firstItemImage.image = menuListWithImages[itemName]
            
            itemName = itemNames[searchResult.count - 3]
            secondItemNameLabel.text = itemName.capitalized
            secondItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            secondItemImage.image = menuListWithImages[itemName]
            
            itemName = itemNames[searchResult.count - 2]
            thirdItemNameLabel.text = itemName.capitalized
            thirdItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            thirdItemImage.image = menuListWithImages[itemName]
            
            itemName = itemNames[searchResult.count - 1]
            fourthItemNameLabel.text = itemName.capitalized
            fourthItemPriceLabel.text = "N" + String(searchResult[itemName]!)
            fourthItemImage.image = menuListWithImages[itemName]


            
        }
    }
    
    
    @IBAction func onClick_itemImage(_ sender: UIButton) {
        
        let whichItemImageButtonClicked = sender.title(for: .normal)
        
        switch whichItemImageButtonClicked {
        case "itemDetailPageButtion1"?:
            clickedItemName = firstItemNameLabel.text!
            clickedItemImage = firstItemImage.image!
            clickedItemPrice = firstItemPriceLabel.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "searchToDetails", sender: self)
            break
            
        case "itemDetailPageButtion2"?:
            clickedItemName = secondItemNameLabel.text!
            clickedItemImage = secondItemImage.image!
            clickedItemPrice = secondItemPriceLabel.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "searchToDetails", sender: self)
            break
            
        case "itemDetailPageButtion3"?:
            clickedItemName = thirdItemNameLabel.text!
            clickedItemImage = thirdItemImage.image!
            clickedItemPrice = thirdItemPriceLabel.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "searchToDetails", sender: self)
            break
            
        case "itemDetailPageButtion4"?:
            clickedItemName = fourthItemNameLabel.text!
            clickedItemImage = fourthItemImage.image!
            clickedItemPrice = fourthItemPriceLabel.text!
            clickedItemDescrp = anonymousUser.getItemDescription(itemName: clickedItemName.lowercased())
            performSegue(withIdentifier: "searchToDetails", sender: self)
            break
            
            
        default:
            break
        }
        
        

        
        
    }

    @IBAction func onClick_addToCart(_ sender: UIButton) {
        
        let whichAddToCartButtonClicked = sender.title(for: .normal)
        
        switch whichAddToCartButtonClicked {
        case "addToCartButton1"?:
            let item = firstItemNameLabel.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton2"?:
            let item = secondItemNameLabel.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton3"?:
            let item = thirdItemNameLabel.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        case "addToCartButton4"?:
            let item = fourthItemNameLabel.text!.lowercased()
            _ = anonymousUser.addToCart(itemNameAndQuantity: [item: 1])
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            break
            
        default:
            totalItemsInCart.text = String(anonymousUser.numberOfItemsInCart())
            
        }
        
        
    }
   
    @IBAction func onClick_Cart(_ sender: UIButton) {
        performSegue(withIdentifier: "searchToOrderSummary", sender: self)
        
    }
    @IBAction func onClick_BackButton(_ sender: UIButton) {
        performSegue(withIdentifier: previousSegue, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "searchToDetails" {
            
            let DestViewController : detailsViewController = segue.destination as! detailsViewController
            DestViewController.itemName = clickedItemName
            DestViewController.image = clickedItemImage
            DestViewController.itemPrice = clickedItemPrice
            DestViewController.itemDescrip = clickedItemDescrp
            DestViewController.previousSegue = "detailsToSearch"
            
        } else if segue.identifier == "searchToOrderSummary" {
            
            let DestViewController : orderSummaryViewController = segue.destination as! orderSummaryViewController
            DestViewController.previousSegue = "orderSummaryToSearch"
            
        }
    }
    


}
