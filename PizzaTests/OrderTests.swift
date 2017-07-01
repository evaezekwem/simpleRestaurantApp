//
//  PizzaTests.swift
//  PizzaTests
//
//  Created by Eva on 26/06/2017.
//  Copyright © 2017 Eva. All rights reserved.
//

import XCTest
@testable import Pizza

class OrderTests: XCTestCase {
    
    let user = User()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddToCartDidExecute() {
        let result: Bool = user.addToCart(itemNameAndQuantity: ["lekki pizza": 2])
        XCTAssertEqual(result, true)
    }
    
    func testNewItemWasAddedToCart() {
        let itemsBeforeAddition: Int = user.itemsInCart.count
        _ = user.addToCart(itemNameAndQuantity: ["lekki pizza": 2])
        let itemsAfterAddition: Int = user.itemsInCart.count
        let result: Int = itemsAfterAddition - itemsBeforeAddition
        XCTAssertEqual(result, 1)
    }
    
    func testRemoveFromCartDidExecute() {
        _ = user.addToCart(itemNameAndQuantity: ["lekki pizza" : 2])
        let result: Bool = user.removeFromCart(itemName: "lekki pizza")
        XCTAssertEqual(result, true)
        
    }
    
    func testExistingItemWasRemovedFromCart() {
        _ = user.addToCart(itemNameAndQuantity: ["lekki pizza": 2])
        let itemsBeforeRemoval: Int = user.itemsInCart.count
        _ = user.removeFromCart(itemName: "lekki pizza")
        let itemsAfterRemoval: Int = user.itemsInCart.count
        let result: Int = itemsBeforeRemoval - itemsAfterRemoval
        XCTAssertEqual(result, 1)
    }
    
    func testNumberOfItemsInCartDidExecute() {
        _ = user.addToCart(itemNameAndQuantity: ["lekki pizza": 1])
        _ = user.addToCart(itemNameAndQuantity: ["beer": 1])
        let result = user.numberOfItemsInCart()
        XCTAssertEqual(result, 2)
    }
    
    func testTotalOrderAddsItem() {
        _ = user.addToCart(itemNameAndQuantity: ["lekki pizza": 1])
        _ = user.addToCart(itemNameAndQuantity: ["beer": 1])
        
        let result : Int = user.totalOrder()
        
        XCTAssertEqual(result, 2750)
        
    }
    
    func testTotalOrderConsidersQuantityOfItems() {
        _ = user.addToCart(itemNameAndQuantity: ["beer": 3])
        let costOfThreeUnits : Int = user.totalOrder()
        
        _ = user.addToCart(itemNameAndQuantity: ["beer": 2])
        let costOfTwoUnits : Int = user.totalOrder()
        
        let result = costOfThreeUnits - costOfTwoUnits
        
        XCTAssertEqual(result, menuListWithoutCategories["beer"])
    }
    
    func testConfirmOrderDidExecute() {
        _ = user.addToCart(itemNameAndQuantity: ["lekki pizza": 1])
        _ = user.addToCart(itemNameAndQuantity: ["beer": 1])
        
        let result = user.confirmOrder()
        XCTAssertEqual(result, true)
    }
    
    func testConfirmOrderDidModifyLastOrder() {
        _ = user.addToCart(itemNameAndQuantity: ["lekki pizza": 1])
        _ = user.confirmOrder()
        let itemInLastOrder1 : Int = user.lastOrder.keys.count
        
        _ = user.addToCart(itemNameAndQuantity: ["lekki pizza": 1])
        _ = user.addToCart(itemNameAndQuantity: ["beer": 1])
        _ = user.confirmOrder()
        let itemInLastOrder2 : Int = user.lastOrder.keys.count
        
        let result = itemInLastOrder2 - itemInLastOrder1
        XCTAssertEqual(result, 1)
    }
    
    func testSearchItemCanReturnExactMatch() {
        let searchResult : [String:Int] = user.searchItem(itemName: "ojuelegba pizza")
        let result = Array(searchResult.keys)[0]
        XCTAssertEqual(result, "ojuelegba pizza")
    }
    
    func testSearchItemCanReturnPartialMatch() {
        let searchResult : [String:Int] = user.searchItem(itemName: "pizza")
        let result = Array(searchResult.keys)
        XCTAssertEqual(result, Array(menuList["pizza"]!.keys))
    }
    
    
    func testSearchUserDidExecute() {
        _ = user.registerUser(inputName: "Test User", inputEmail: "test@mail.com", inputPassword: "secretpass", inputPhone: 12345, inputDeliveryAddress: "1 Unit Test Street, Xcode Avenue, Swift State, Apple Inc")
        let result = user.checkUser(inputEmail: "test@mail.com")
        XCTAssertEqual(result, "test@mail.com")
    }
    
    func testDeleteUserDidExecute() {
        _ = user.registerUser(inputName: "Test User", inputEmail: "test1@mail.com", inputPassword: "secretpass", inputPhone: 5555555525, inputDeliveryAddress: "1 Unit Test Street, Xcode Avenue, Swift State, Apple Inc")
        let result = user.deleteUser(inputEmail: "test@mail.com", inputPassword: "secretpass")
        XCTAssertEqual(result, true)
    }
    
    func testDeleteUserDidDeletedRegisteredUser() {
        _ = user.registerUser(inputName: "Test User", inputEmail: "test2@mail.com", inputPassword: "secretpass", inputPhone: 43556678, inputDeliveryAddress: "1 Unit Test Street, Xcode Avenue, Swift State, Apple Inc")
        _ = user.deleteUser(inputEmail: "test@mail.com", inputPassword: "secretpass")
        let result = user.checkUser(inputEmail:"test@mail.com")
        XCTAssertEqual(result, "Not found")
    }
    
    
    func testRegisterUserDidExecute() {
        _ = user.deleteUser(inputEmail: "test@mail.com", inputPassword: "secretpass")
        let result = user.registerUser(inputName: "Test User", inputEmail: "test@mail.com", inputPassword: "secretpass", inputPhone: 23470334444556, inputDeliveryAddress: "1 Unit Test Street, Xcode Avenue, Swift State, Apple Inc")
        
        XCTAssertEqual(result, true)
    }
    
    
    func testRegisterUserDidRegisterNewUser() {
        _ = user.deleteUser(inputEmail: "test@mail.com", inputPassword: "secretpass")
        _ = user.registerUser(inputName: "Test User", inputEmail: "test@mail.com", inputPassword: "secretpass", inputPhone: 55555555, inputDeliveryAddress: "1 Unit Test Street, Xcode Avenue, Swift State, Apple Inc")
        
        let result = user.checkUser(inputEmail: "test@mail.com")
        XCTAssertEqual(result, "test@mail.com")
    }
    
    func testLoginUserDidExecute() {
        _ = user.registerUser(inputName: "Test User", inputEmail: "test@mail.com", inputPassword: "secretpass", inputPhone: 55555555, inputDeliveryAddress: "1 Unit Test Street, Xcode Avenue, Swift State, Apple Inc")
        var result = user.loginUser(inputEmail: "test@mail.com", inputPassword: "secretpass")
        result = Bool(result)
        
        XCTAssertEqual(result, true)
    }
    
    
    func testLoginUserDidELoginRegisteredUser() {
        _ = user.registerUser(inputName: "Test User", inputEmail: "test@mail.com", inputPassword: "secretpass", inputPhone: 55555555, inputDeliveryAddress: "1 Unit Test Street, Xcode Avenue, Swift State, Apple Inc")
        _ = user.loginUser(inputEmail: "test@mail.com", inputPassword: "secretpass")
        let result = loggedInUser.userName
        
        XCTAssertEqual(result, "Test User")
    }
        
}
