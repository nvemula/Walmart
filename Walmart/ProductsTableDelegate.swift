//
//  ProductsTableDelegate.swift
//  Walmart
//
//  Created by Nayan Vemula on 6/16/16.
//  Copyright © 2016 Happy. All rights reserved.
//

/*
 Tableview delegate foor list of products
 
 */

import Foundation
import UIKit
import Haneke

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return productItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let product = productItems[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductTableCell", forIndexPath: indexPath) as! ProductTableCell
            
            // Configure the cell...
            cell.productName.text = product.getName()
            cell.price.text = product.getPrice()
            cell.ratingView.rating = Double(product.getRating())
            cell.ratingView.text = "(\(String(product.getReviewCount())))"
        
            if(!product.getInStock()) {
                cell.inStock.text = "OUT OF STOCK"
            }
            else {
                cell.inStock.text = ""
            }
            
            let url = NSURL(string:product.getImageURL())
            let plc = UIImage(named: "placeholder")
            cell.productImage.hnk_setImageFromURL(url!, placeholder: plc)
        
            return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row < productItems.count){
            if(self.productsShown[indexPath.row] == false){
                let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 100, -20)
                cell.layer.transform = rotationTransform
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    cell.layer.transform = CATransform3DIdentity
                })
                self.productsShown[indexPath.row]  = true
            }
        }
        if(indexPath.row == productItems.count - 1){
            self.pageNumber = self.pageNumber + 1
            self.getProducts()
        }
    }
    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Return NO if you do not want the specified item to be editable.
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        
    }
}