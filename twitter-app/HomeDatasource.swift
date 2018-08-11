//
//  HomeDatasourceControl.swift
//  twitter-app
//
//  Created by Student 3 on 25/7/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON


class HomeDatasource: Datasource, JSONDecodable{
    
    let followers : [Follower] 
    
    let tweets : [Tweet]
    
    required init(json: JSON) throws {
        let userJSONArray = json["users"].array
        self.followers = userJSONArray!.map({return Follower(json: $0)})

        let tweetJSONArray = json["tweets"].array
        self.tweets = tweetJSONArray!.map({return Tweet(json: $0)})
    }
    
    // MARK: configure items
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        else {return followers[indexPath.item]}
    }
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {return tweets.count}
        return followers.count
    }
    
    // MARK: configure cells: header, body, footer
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [FollowerCell.self, TweetCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [FollowerHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FollowerFooter.self]
    }
    
}




