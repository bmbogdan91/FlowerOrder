//
//  FlowerOrderDetailsViewController.swift
//  FlowerPower
//
//  Created by Ioana Marian on 2/1/18.
//  Copyright © 2018 Padurariu Bogdan. All rights reserved.
//

import UIKit

class FlowerOrderDetailsViewController: UIViewController {

    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak internal var nameLabel: UILabel!
    @IBOutlet weak internal var deliverToLabel: UILabel!
    @IBOutlet weak internal var priceLabel : UILabel!
    
    var order : Order?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detail order"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateOrder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateOrder() -> Void {
        self.nameLabel.text = order?.name
        self.priceLabel.text = String(describing: order?.price!)
        self.deliverToLabel.text = order?.deliverTo
        
        let manager = ServiceManager()
        manager.dowloadImageWithURL(url: self.order?.imageURL) { (image) in
            self.flowerImageView.image = image
        }
        
    }
    

}
