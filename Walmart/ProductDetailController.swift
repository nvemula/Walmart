//
//  ProductDetailController.swift
//  Walmart
//
//  Created by Nayan Vemula on 6/15/16.
//  Copyright © 2016 Happy. All rights reserved.
//

/*
 This class is used to show the details od a product.
 
 */

import Foundation
import UIKit
import Cosmos

class ProductDetailController:UIViewController {
    
    @IBOutlet weak var inStock: UILabel!
    @IBOutlet weak var longDescription: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    var productItems = [Product]()
    var currentItem = 0
    
    override func viewWillAppear(animated: Bool) {
        
        // Called by iOS just before the appearance of a view
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Add swipe gestures
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ProductDetailController.handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ProductDetailController.handleSwipes(_:)))
           
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        if(productItems.count > 0){
            self.populateView()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func populateView(){
    
        let product = productItems[currentItem]
        
        // Configure the cell...
        self.productName.text = product.getName()
        
        self.price.text = product.getPrice()
        self.ratingView.rating = Double(product.getRating())
        self.ratingView.text = "(\(String(product.getReviewCount())))"
        self.longDescription.text = product.getLongDesc()
        
        if(!product.getInStock()) {
            self.inStock.text = "OUT OF STOCK"
        }
        else {
            self.inStock.text = ""
        }
        
        let url = NSURL(string:product.getImageURL())
        let plc = UIImage(named: "placeholder")
        self.productImage.hnk_setImageFromURL(url!, placeholder: plc)
    
    }
    
    func handleSwipes(sender: UISwipeGestureRecognizer){
        
        if(sender.direction == .Left){
            if(currentItem + 1 < productItems.count){
                currentItem += 1
                populateView()
                self.animateViewsLeft()
            }
        }
        else if(sender.direction == .Right){
            if(currentItem > 0){
                currentItem -= 1
                populateView()
                self.animateViewsRight()
            }
        
        }
    }
    
    func animateViewsLeft(){
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 0, 0)
        self.productName.layer.transform = rotationTransform
        self.productImage.layer.transform = rotationTransform
        self.price.layer.transform = rotationTransform
        self.ratingView.layer.transform = rotationTransform
        self.inStock.layer.transform = rotationTransform
        self.longDescription.layer.transform = rotationTransform

        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.productName.layer.transform = CATransform3DIdentity
            self.productImage.layer.transform = CATransform3DIdentity
            self.price.layer.transform = CATransform3DIdentity
            self.ratingView.layer.transform = CATransform3DIdentity
            self.inStock.layer.transform = CATransform3DIdentity
            self.longDescription.layer.transform = CATransform3DIdentity
        })
    }
    
    func animateViewsRight(){
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        self.productName.layer.transform = rotationTransform
        self.productImage.layer.transform = rotationTransform
        self.price.layer.transform = rotationTransform
        self.ratingView.layer.transform = rotationTransform
        self.inStock.layer.transform = rotationTransform
        self.longDescription.layer.transform = rotationTransform
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.productName.layer.transform = CATransform3DIdentity
            self.productImage.layer.transform = CATransform3DIdentity
            self.price.layer.transform = CATransform3DIdentity
            self.ratingView.layer.transform = CATransform3DIdentity
            self.inStock.layer.transform = CATransform3DIdentity
            self.longDescription.layer.transform = CATransform3DIdentity
        })
    }

}