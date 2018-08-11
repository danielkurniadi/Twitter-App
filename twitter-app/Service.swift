//
//  Service.swift
//  twitter-app
//
//  Created by Student 3 on 10/8/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service{
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    static let sharedInstance = Service()
    
    class JSONError: JSONDecodable{
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> () ){
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            // code
            completion(homeDatasource)
            
        }) { (err) in
            // code
            print("Failure in fetching JSON object", err)
        }
    }
}
