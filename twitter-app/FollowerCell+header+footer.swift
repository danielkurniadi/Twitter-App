//
//  FollowerCell.swift
//  twitter-app
//
//  Created by Student 3 on 28/7/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import LBTAComponents

fileprivate let twitterblue = UIColor(r: 61, g: 167, b: 244)

class FollowerCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet{
            guard let follower = datasourceItem as? Follower else {return}
            nameLabel.text = follower.twitterName
            usernameLabel.text = follower.username
            userTextView.text = follower.wallpost
            profileImage.image = follower.profileImage
            profileImage.loadImage(urlString: follower.profileURL)
            
        }
    }
    
    let profileImage : CachedImageView = {
        let imageview = CachedImageView()
        imageview.image = UIImage(named: "donni_profile")
        imageview.layer.cornerRadius = 5
        imageview.clipsToBounds = true
        return imageview
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Leonardo Donni"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        //        label.backgroundColor = UIColor.green
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@Donnyimoetz"
        label.textColor = UIColor(r: 110, g: 110, b: 110)
        label.font = UIFont.systemFont(ofSize: 14)
        //        label.backgroundColor = UIColor.purple
        return label
    }()
    
    let userTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.text = "Who would have known that one boy’s journey almost comes to an end. It was not easy, it was not smooth."
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let followButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = UIColor.white
        
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(userTextView)
        addSubview(followButton)
        addSubview(usernameLabel)
        
        //separator line
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        // profile pict layout
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        // name label layout
        nameLabel.anchor(profileImage.topAnchor, left: profileImage.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        // username label layout
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        // text view layout
        userTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 10, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
        // follower like button
        setupFollowButton()
        followButton.anchor(profileImage.topAnchor, left: nil, bottom: usernameLabel.bottomAnchor, right: userTextView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 12, widthConstant: 130, heightConstant: 0)
    }
    
    private func setupFollowButton(){
        let iconimg = UIImage(named: "follow_icon")
        
        followButton.layer.cornerRadius = 5
        followButton.layer.borderColor = twitterblue.cgColor
        followButton.layer.borderWidth = 1.5
        followButton.clipsToBounds = true
        followButton.backgroundColor = UIColor.clear
        followButton.setTitle("Follow me", for: .normal)
        followButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        followButton.setTitleColor(twitterblue, for: .normal)
        
        followButton.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.titleLabel?.centerXAnchor.constraint(equalTo: followButton.centerXAnchor, constant: 8).isActive = true
        
        followButton.setImage(iconimg, for: .normal)
        followButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        followButton.imageView?.rightAnchor.constraint(equalTo: (followButton.titleLabel?.leftAnchor)!, constant: -4).isActive = true
        followButton.imageView?.topAnchor.constraint(equalTo: followButton.topAnchor).isActive = true
        followButton.imageView?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        followButton.imageView?.widthAnchor.constraint(equalToConstant: 25).isActive = true
        followButton.imageView?.contentMode = .scaleAspectFit
        followButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
    }
}


// MARK: Twitter Header

class FollowerHeader: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW ..."
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = twitterblue
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = UIColor.white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}


// MARK: Twitter Footer

class FollowerFooter: DatasourceCell{
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more +"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(r: 61, g: 167, b: 244)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = UIColor.clear
        
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = UIColor.white
        
        addSubview(whiteBackgroundView)
        addSubview(textLabel)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
