
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
    
    
    @IBOutlet weak var fouthItemNameLabel: UILabel!
    @IBOutlet weak var fouthItemImage: UIImageView!
    @IBOutlet weak var fouthItemPriceLabel: UILabel!
    @IBOutlet var fourthView: UIView!
    
    
    @IBOutlet weak var totalItemsInCart: UILabel!
    
    var previousSegue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.isHidden = true
        secondView.isHidden = true
        thirdView.isHidden = true
        fourthView.isHidden = true
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onClick_itemImage(_ sender: UIButton) {
        
        
    }

    @IBAction func onClick_addToCart(_ sender: UIButton) {
        
        
    }
   
    @IBAction func onClick_Cart(_ sender: UIButton) {
        
        
    }
    @IBAction func onClick_BackButton(_ sender: UIButton) {
        performSegue(withIdentifier: previousSegue, sender: self)
    }

}
