//
//  Order.swift
//  FlowerPower
//
//  Created by Ioana Marian on 2/1/18.
//  Copyright © 2018 Padurariu Bogdan. All rights reserved.
//

import UIKit

class Order: NSObject {

    var orderID: Int?
    var imageURL: String? 
    var name: String?
    var price: Int?
    var deliverTo: String?
    
    init(dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        
        orderID = dictionary["id"] as? Int
        imageURL = dictionary["image_url"] as? String
        name = dictionary["description"] as? String
        price = dictionary["price"] as? Int
        deliverTo = dictionary["deliver_to"] as? String
    }
}
