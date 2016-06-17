//
//  DataRequest.swift
//  Walmart
//
//  Created by Nayan Vemula on 6/15/16.
//  Copyright © 2016 Happy. All rights reserved.
//

import Foundation

class DataRequest {
    
    // Configure API key
    private final let API_KEY = ""
    
    func getProducts(page: Int) -> Future<[Product]>{
        
        let url = "https://walmartlabs-test.appspot.com/_ah/api/walmart/v1/walmartproducts/\(self.API_KEY)/\(page)/10"
        //let url = "https://www.dropbox.com/s/uz5mwprqjz4qcye/products.json?dl=1"
        let promise = Promise<[Product]>()
        // Results
        let session = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!,
                     completionHandler : {(data, response, error) -> Void in
                                                                    
        if let httpResponse = response as? NSHTTPURLResponse {
            let statusCode = httpResponse.statusCode
            if(statusCode == 200 && data != nil){
                // Data object is filled
                let parser = DataParser()
                let products = parser.parseProducts(data!)
                promise.completeWithSuccess(products)
            }
            else {
                promise.completeWithFail("Failed to fetch")
            }
        }
        })
        session.resume()
        return promise.future
    }
}