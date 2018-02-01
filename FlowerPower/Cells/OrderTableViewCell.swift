//
//  OrderTableViewCell.swift
//  FlowerPower
//
//  Created by Ioana Marian on 2/1/18.
//  Copyright © 2018 Padurariu Bogdan. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak internal var nameLabel: UILabel!
    @IBOutlet weak internal var deliverToLabel: UILabel!
    
    private var storedOrder : Order!
    
    var  order: Order {
        get {
            return storedOrder
        }
        
        set {
            storedOrder = newValue
            self.nameLabel.text = storedOrder.name
            self.deliverToLabel.text = storedOrder.deliverTo
            
            self.updateImage(url: storedOrder.imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateImage(url : String?) -> Void {
        let manager = ServiceManager()
        manager.dowloadImageWithURL(url: url) { (image) in
            self.flowerImageView.image = image
        }
    }
    
}
