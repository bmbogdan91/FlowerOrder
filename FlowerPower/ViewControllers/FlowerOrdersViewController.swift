//
//  FlowerOrdersViewController.swift
//  FlowerPower
//
//  Created by Ioana Marian on 2/1/18.
//  Copyright © 2018 Padurariu Bogdan. All rights reserved.
//

import UIKit


class FlowerOrdersViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var orderListArray : [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Orders"
        tableView.register(UINib (nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let manager = ServiceManager()
        
        manager.createRequest { (response, error) in
            if (error != nil) {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription , preferredStyle: UIAlertControllerStyle.alert)
                self.present(alertController, animated: true, completion: {
                    alertController.dismiss(animated: true, completion: nil)
                })
            }else{
                self.orderListArray.removeAll()
                for dictionary in response! {
                    let order = Order.init(dictionary: dictionary as! [String : Any])
                    self.orderListArray.append(order)
                }
            }
            self.tableView.reloadData()
       
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! OrderTableViewCell
        
        let order = self.orderListArray[indexPath.row]
        cell.order = order;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let order = self.orderListArray[indexPath.row]
        
        let flowerOrderDetailsController:FlowerOrderDetailsViewController =  (self.storyboard?.instantiateViewController(withIdentifier: "FlowerOrderDetailsViewController") as? FlowerOrderDetailsViewController)!
        flowerOrderDetailsController.order = order
        self.navigationController?.pushViewController(flowerOrderDetailsController, animated: true)
    }

}
