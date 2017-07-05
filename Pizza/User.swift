import Foundation
import SQLite



class User: Order {
    static  let shared:User = User()
    private let db: Connection?
    
    var userName:String = String()
    var userIsLoggedIn:Bool = Bool()
    var userEmail:String = String()
    var userPassword:String = "secretpass"
    var userPhone:Int64 = Int64()
    var userDeliveryAddress:String = String()
    var userPreviousOrder:String = String()
    
    //Initializing table columns for various menu items
    private let tblRice = Table("rice")
    private let riceId =  Expression<Int64?>("id")
    private let riceName = Expression<String>("name")
    private let ricePrice = Expression<Int64>("price")
    private let riceImageName = Expression<String>("imageName")
    
    private let tblStew = Table("stew")
    private let stewId =  Expression<Int64?>("id")
    private let stewName = Expression<String>("name")
    private let stewPrice = Expression<Int64>("price")
    private let stewImageName = Expression<String>("imageName")

    private let tblSwallow = Table("swallow")
    private let swallowId =  Expression<Int64?>("id")
    private let swallowName = Expression<String>("name")
    private let swallowPrice = Expression<Int64>("price")
    private let swallowImageName = Expression<String>("imageName")

    private let tblSoup = Table("soup")
    private let soupId =  Expression<Int64?>("id")
    private let soupName = Expression<String>("name")
    private let soupPrice = Expression<Int64>("price")
    private let soupImageName = Expression<String>("imageName")

    private let tblPizza = Table("pizza")
    private let pizzaId =  Expression<Int64?>("id")
    private let pizzaName = Expression<String>("name")
    private let pizzaPrice = Expression<Int64>("price")
    private let pizzaImageName = Expression<String>("imageName")

    private let tblDrinks = Table("drinks")
    private let drinkId =  Expression<Int64?>("id")
    private let drinkName = Expression<String>("name")
    private let drinkPrice = Expression<Int64>("price")
    private let drinkImageName = Expression<String>("imageName")

    //Initializing table columns for users
    private let tblUsers = Table("users")
    private let userId = Expression<Int64?>("id")
    private let name = Expression<String>("name")
    private let email = Expression<String>("email")
    private let password = Expression<String>("password")
    private let phone = Expression<Int64>("phone")
    private let deliveryAddress = Expression<String>("deliveryAddress")
    private let previousOrder = Expression<String?>("previousOrder")
    
    
    
    override init () {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/chopizzadb.sqlite3") //creates an empty database with name ishop.sqlite3
            //createTables()
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }
    
    func createTables() {
        do {
            try db!.run(tblRice.create(ifNotExists: true) { table in
                table.column(riceId, unique: true)
                table.column(riceName, primaryKey: true)
                table.column(ricePrice)
                table.column(riceImageName)
            })
            print("create rice table successfully")
        } catch {
            print("Unable to create rice tables")
        }
        
        do {
            try db!.run(tblStew.create(ifNotExists: true) { table in
                table.column(stewId,  unique: true)
                table.column(stewName, primaryKey: true)
                table.column(stewPrice)
                table.column(stewImageName)
            })
            print("create stew table successfully")
        } catch {
            print("Unable to create stew tables")
        }
        
        do {
            try db!.run(tblSwallow.create(ifNotExists: true) { table in
                table.column(swallowId,  unique: true)
                table.column(swallowName, primaryKey: true)
                table.column(swallowPrice)
                table.column(swallowImageName)
            })
            print("create swallow table successfully")
        } catch {
            print("Unable to create swallow tables")
        }
        
        do {
            try db!.run(tblSoup.create(ifNotExists: true) { table in
                table.column(soupId,  unique: true)
                table.column(soupName,primaryKey: true)
                table.column(soupPrice)
                table.column(soupImageName)
            })
            print("create soup table successfully")
        } catch {
            print("Unable to create soup tables")
        }
        
        do {
            try db!.run(tblPizza.create(ifNotExists: true) { table in
                table.column(pizzaId,  unique: true)
                table.column(pizzaName, primaryKey: true)
                table.column(pizzaPrice)
                table.column(pizzaImageName)
            })
            print("create pizza table successfully")
        } catch {
            print("Unable to create pizza tables")
        }
        
        do {
            try db!.run(tblDrinks.create(ifNotExists: true) { table in
                table.column(drinkId,  unique: true)
                table.column(drinkName,primaryKey: true)
                table.column(drinkPrice)
                table.column(drinkImageName)
            })
            print("create drink table successfully")
        } catch {
            print("Unable to create drink tables")
        }
        
        do {
            try db!.run(tblUsers.create(ifNotExists: true) { table in
                table.column(userId,unique: true )
                table.column(email, primaryKey: true)
                table.column(password)
                table.column(name)
                table.column(phone, unique: true)
                table.column(deliveryAddress)
                table.column(previousOrder)
            })
            print("create users table successfully")
        } catch {
            print("Unable to create users tables")
        }
        
    }

    
    func checkUser(inputEmail: String) -> String {
    
        let result = "Not found"
        let query = tblUsers.filter(email == inputEmail)
        for user in try! db!.prepare(query){
        
            print("email: \(user[email])")
            return user[email]
        }
        print("\(inputEmail) not found in database")
        return result
    }
    
    func registerUser(inputName: String, inputEmail: String, inputPassword: String, inputPhone: Int64, inputDeliveryAddress: String) -> Bool {
        do {
            let insert = tblUsers.insert(email <- inputEmail, password <- inputPassword, name <- inputName, phone <- inputPhone, deliveryAddress <- inputDeliveryAddress)
            let id = try db!.run(insert)
            
            print("New user registered successfully with UserID: \(id)")
            
            return true
        } catch {
            print("Cannot register user to database \(error)")
            return false
        }

    }
    
    func deleteUser(inputEmail: String, inputPassword: String) -> Bool {
        if inputPassword == self.userPassword {
            do {
                let contact = tblUsers.filter(email == inputEmail)
                try db!.run(contact.delete())
                print("Delete contact successful")
                return true
            } catch {
                print("Delete failed \(error)")
                return false
            }
        }
        
        return false
    }
    
    
    func loginUser(inputEmail: String, inputPassword: String) -> Bool {
        if checkUser(inputEmail: inputEmail) == inputEmail {
            let query = tblUsers.filter(email == inputEmail)
            for user in try! db!.prepare(query){
                let actualPassword = user[password]
                if actualPassword == inputPassword {
                    loggedInUser.userEmail = inputEmail
                    loggedInUser.userPassword = inputPassword
                    loggedInUser.userName = user[name]
                    loggedInUser.userPhone = user[phone]
                    loggedInUser.userDeliveryAddress = user[deliveryAddress]
                    loggedInUser.userPreviousOrder = user[previousOrder] ?? ""
                    loggedInUser.userIsLoggedIn = true
                    self.userIsLoggedIn = true
                    return true
                }
            }
        
        }
        
        return false
    }
        
    func addMenu(category: String, inputName: String, inputPrice: Int64, inputImageName: String) -> Bool {
        switch category.lowercased(){
        case "rice":
            do {
                let insert = tblRice.insert(name <- inputName, ricePrice <- inputPrice, riceImageName <- inputImageName)
                let id = try db!.run(insert)
                
                print("New rice item registered successfully with ID: \(id)")
                
                return true
            } catch {
                print("Cannot register rice item to database \(error)")
                return false
            }

        case "stew":
            do {
                let insert = tblStew.insert(name <- inputName, stewPrice <- inputPrice, stewImageName <- inputImageName)
                let id = try db!.run(insert)
                
                print("New stew item registered successfully with ID: \(id)")
                
                return true
            } catch {
                print("Cannot register stew item to database \(error)")
                return false
            }
            
        case "swallow":
            do {
                let insert = tblSwallow.insert(name <- inputName, swallowPrice <- inputPrice, swallowImageName <- inputImageName)
                let id = try db!.run(insert)
                
                print("New swallow item registered successfully with ID: \(id)")
                
                return true
            } catch {
                print("Cannot register swallow item to database \(error)")
                return false
            }

        case "soup":
            do {
                let insert = tblSoup.insert(name <- inputName, soupPrice <- inputPrice, soupImageName <- inputImageName)
                let id = try db!.run(insert)
                
                print("New soup item registered successfully with ID: \(id)")
                
                return true
            } catch {
                print("Cannot register soup item to database \(error)")
                return false
            }
            
        case "pizza":
            do {
                let insert = tblPizza.insert(name <- inputName, pizzaPrice <- inputPrice, pizzaImageName <- inputImageName)
                let id = try db!.run(insert)
                
                print("New pizza item registered successfully with ID: \(id)")
                
                return true
            } catch {
                print("Cannot register pizza item to database \(error)")
                return false
            }

        case "drinks":
            do {
                let insert = tblDrinks.insert(name <- inputName, drinkPrice <- inputPrice, drinkImageName <- inputImageName)
                let id = try db!.run(insert)
                
                print("New drink item registered successfully with ID: \(id)")
                
                return true
            } catch {
                print("Cannot register drink item to database \(error)")
                return false
            }
            

        default:
            break
        }
        return false
    }
    
    
    
}
