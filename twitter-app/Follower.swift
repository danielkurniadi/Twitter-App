//
//  Structure.swift
//  twitter-app
//
//  Created by Student 3 on 26/7/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit
import SwiftyJSON

struct  Follower {
    let twitterName: String
    let username: String
    let wallpost: String
    let profileImage : UIImage
    let profileURL: String
    
    init(json: JSON){
        self.twitterName = json["name"].stringValue
        self.username = json["username"].stringValue
        self.wallpost = json["bio"].stringValue
        self.profileImage = UIImage()
        self.profileURL = json["profileImageUrl"].stringValue
    }

}
