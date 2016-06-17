//
//  ProductTableCell.swift
//  Walmart
//
//  Created by Nayan Vemula on 6/15/16.
//  Copyright © 2016 Happy. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class ProductTableCell: UITableViewCell {

    
    @IBOutlet weak var productName: UILabel!

    @IBOutlet weak var productImage: UIImageView!

    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var inStock: UILabel!
    
    @IBOutlet weak var ratingView: CosmosView!
}