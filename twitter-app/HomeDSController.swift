//
//  HomeDataSourceController.swift
//  twitter-app
//
//  Created by Student 3 on 10/8/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController{
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)

        // data
        Service.sharedInstance.fetchHomeFeed { (homeDatasource) in
            self.datasource = homeDatasource
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let follower = datasource?.item(indexPath) as? Follower{
            let wallpost = follower.wallpost
            let appxTextWidth = view.frame.width-60-12-8
            let font = UIFont.systemFont(ofSize: 15)
            let estimatedHeight = wallpost.frameHeight(withConstrainedWidth: appxTextWidth, font: font)
            return CGSize(width: view.frame.width, height: estimatedHeight+66+10+10)
        }
        
        if let twitter = datasource?.item(indexPath) as? Tweet{
            let message = twitter.message
            let appxTextWidth = view.frame.width-60-12-8
            let font = UIFont.systemFont(ofSize: 15)
            let estimatedHeight = message.frameHeight(withConstrainedWidth: appxTextWidth, font: font)
            return CGSize(width: view.frame.width, height: estimatedHeight+66+10+10)
        }

        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section != 0 {return CGSize.zero}
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section != 0 {return CGSize.zero}
        return CGSize(width: view.frame.width, height: 64)
    }
    
}
