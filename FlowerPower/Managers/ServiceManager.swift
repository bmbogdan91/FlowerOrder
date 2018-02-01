//
//  ServiceManager.swift
//  FlowerPower
//
//  Created by Ioana Marian on 2/1/18.
//  Copyright © 2018 Padurariu Bogdan. All rights reserved.
//

import UIKit
import Alamofire

class ServiceManager: NSObject {
    
    func createRequest(completion: @escaping (_ result:Array <Any>?, _ error: NSError?) -> Void) {
    
        Alamofire.request("http://demo8312574.mockable.io/orders").responseJSON {  response in
            print(response)
            //to get status code
            if let status = response.response?.statusCode {
                switch(status){
                case 404:
                    completion (nil, NSError.init(domain: "FlowerPower", code: 1, userInfo:[NSLocalizedDescriptionKey : "Connection Error"]))
                default:
                    print("error with response status: \(status)")
                }
            }
            //to get JSON return value
            if let result = response.result.value {
                let listArray = result as! NSArray
                print(listArray)
                completion (listArray as! Array<Any>, nil)
            }
        }
        
    }
    
    func dowloadImageWithURL(url: String?, completion: @escaping (_ image:UIImage) -> Void) {
        if let imageurl = url {
            Alamofire.request(imageurl).responseData { imageData in
                
            let image  = UIImage.init(data: imageData.data!)
            completion(image!)
            }
        }
        else{
            completion(UIImage.init())
        }
    }
}
