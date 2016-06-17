//
//  DataParser.swift
//  Walmart
//
//  Created by Nayan Vemula on 6/15/16.
//  Copyright © 2016 Happy. All rights reserved.
//

import Foundation

class DataParser{

    func parseProducts(data: NSData) -> [Product]{
        
        var products:[Product] = [Product]()
        
        //var datastring = NSString(data: data, encoding: NSUTF8StringEncoding)        
        let json = JSON(data: data)
            let productsArray: Array<JSON> = json["products"].arrayValue
            for item in productsArray {
                let product = parseProduct(item)
                products.append(product)
            }
        
        return products
    }
    
    func parseProduct(item: JSON) -> Product {
        
        let product: Product = Product()
        
        product.setID(item["productId"].stringValue)
        
        product.setName(item["productName"].stringValue)
                
        product.setShortDesc(item["shortDescription"].stringValue)
        
        product.setLongDesc(item["longDescription"].stringValue)
        
        product.setPrice(item["price"].stringValue)
        
        product.setImageURL(item["productImage"].stringValue)

        product.setRating(item["reviewRating"].floatValue)

        product.setReviewCount(item["reviewCount"].intValue)

        product.setInStock(item["inStock"].boolValue)
        
        return product
        
    }
    
        
    
    
    
}