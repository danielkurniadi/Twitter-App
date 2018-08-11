//
//  Tweet.swift
//  twitter-app
//
//  Created by Student 3 on 10/8/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import Foundation
import SwiftyJSON

struct  Tweet {
    let follower: Follower
    let message: String
    
    init(json: JSON){
        let followerJSON = json["user"]
        self.follower = Follower(json: followerJSON)
        self.message = json["message"].stringValue
    }
}
