//
//  ViewController.swift
//  Walmart
//
//  Created by Nayan Vemula on 6/15/16.
//  Copyright © 2016 Happy. All rights reserved.
//
/*
 
 This class is the initial ViewController that is launched & contains a tableview to show the list of products. As users scroll to the bottom, new items are added.
 
 */
import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var productsTable: UITableView!
    
    var productItems = [Product]()
    @IBOutlet weak var message: UILabel!
    var pageNumber = 1
    var productsShown = [Bool](count: 0, repeatedValue: false)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.productsTable.hidden = true
        self.message.hidden = true

        // Set delegate & datasource of tableview
        self.productsTable.delegate = self
        self.productsTable.dataSource = self
        // Get products from server
        self.getProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getProducts(){
        let request = DataRequest()
        // request data of current page
        let futureList:Future<[Product]> = request.getProducts(self.pageNumber)
        futureList.onSuccess(.Main) { list in
            // append to list
            self.productItems += list
            if(self.productItems.count > 0){
                // update table
                self.productsShown = [Bool](count: self.productItems.count, repeatedValue: false)
                self.message.hidden = true
                self.activityIndicator.stopAnimating()
                self.updateTable()
            }
            else {
                self.message.hidden = false
                self.message.text = "No Products"
            }
            }.onFail(block: {_ in
                // display error msg
                self.activityIndicator.stopAnimating()

                self.message.hidden = false
                self.message.text = "Try again later"
            })
    }
    
    func updateTable(){
        self.productsTable.hidden = false
        self.productsTable.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Pass the selected object to ProductDetail.
        if segue.identifier == "gotoProduct" {
            
            if let indexPath = self.productsTable.indexPathForSelectedRow {
                let destinationViewController = segue.destinationViewController as! ProductDetailController
                destinationViewController.productItems = self.productItems
                destinationViewController.currentItem = indexPath.row
            }
        }
    }
}

