//
//  HomeDSC+extension.swift
//  twitter-app
//
//  Created by Student 3 on 10/8/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import LBTAComponents

extension HomeDatasourceController {
     func setupNavigationBarItems(){
        setupLeftNavItemLayout()
        setupRightNavItemLayout()
        setupExtraNavItemLayout()
        
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupLeftNavItemLayout(){
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItemLayout(){
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composerButton = UIButton(type: .system)
        composerButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composerButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        // arrangement is counter intuitive, first element starts at right then to the left
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composerButton), UIBarButtonItem(customView: searchButton)]
    }
    
    private func setupExtraNavItemLayout(){
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        // TODO navigation bottom thin line
        let navBarSeparatorLine = UIView()
        navBarSeparatorLine.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorLine)
        navBarSeparatorLine.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1.0)
    }
}
