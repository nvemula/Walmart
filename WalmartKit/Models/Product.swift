//
//  Product.swift
//  Walmart
//
//  Created by Nayan Vemula on 6/15/16.
//  Copyright © 2016 Happy. All rights reserved.
//

import Foundation

class Product {

    private var id:String
    private var name:String
    private var shortDescription:String
    private var longDescription:String
    private var price:String
    private var imageURL:String
    private var rating:Float
    private var reviewCount:Int
    private var inStock:Bool
    
    init(){
        self.id = String()
        self.name = String()
        self.shortDescription = String()
        self.longDescription = String()
        self.price = String()
        self.imageURL = String()
        self.rating = Float()
        self.reviewCount = Int()
        self.inStock = Bool()
    }
    
    func setID(id: String){
        self.id = id
    }
    
    func getID() -> String {
        return self.id
    }
    
    func setName(name: String){
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func setShortDesc(desc: String){
        self.shortDescription = desc
    }
    
    func getShortDesc() -> String {
        return self.shortDescription
    }
    func setLongDesc(desc: String){
        self.longDescription = desc
    }
    
    func getLongDesc() -> String {
        return self.longDescription
    }
    
    func setPrice(price: String){
        self.price = price
    }
    
    func getPrice() -> String {
        return self.price
    }
    
    func setImageURL(url: String){
        self.imageURL = url
    }
    
    func getImageURL() -> String {
        return self.imageURL
    }
    
    func setRating(rating: Float){
        self.rating = rating
    }
    
    func getRating() -> Float {
        return self.rating
    }
    
    func setReviewCount(reviewCount: Int){
        self.reviewCount = reviewCount
    }
    
    func getReviewCount() -> Int {
        return self.reviewCount
    }
    
    func setInStock(inStock: Bool){
        self.inStock = inStock
    }
    
    func getInStock() -> Bool {
        return self.inStock
    }
    
    
    
}