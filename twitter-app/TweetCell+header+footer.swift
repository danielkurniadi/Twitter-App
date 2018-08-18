//
//  TweetCell.swift
//  twitter-app
//
//  Created by Student 3 on 10/8/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet{
            guard let tweet = datasourceItem as? Tweet else {return}
            
            let attributedText = NSMutableAttributedString(string: tweet.follower.twitterName, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)])
            
            attributedText.append(NSAttributedString(string: "  \(tweet.follower.username)\n", attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
            
            profileImage.loadImage(urlString: tweet.follower.profileURL) 
        }
    }
    
    let messageTextView: UITextView = {
        let textview = UITextView()
        textview.backgroundColor = UIColor.clear
        textview.text = "Sample Text Lorem Ipsum Lorem Ipsum Lorem Ipsum Nahmana Lakad Matatag Normalin Normalin"
        textview.isEditable = false
        textview.isScrollEnabled = false
        return textview
    }()
    
    let profileImage : CachedImageView = {
        let imageview = CachedImageView()
        imageview.image = UIImage(named: "donni_profile")
        imageview.layer.cornerRadius = 5
        imageview.clipsToBounds = true
        return imageview
    }()
    
    let replyButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let sendMsgButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = UIColor.white
        
        addSubview(profileImage)
        addSubview(messageTextView)
        
        // anchor and layouts
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        messageTextView.anchor(profileImage.topAnchor, left: profileImage.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -8, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
        setupButtonLayout()
        
    }
    
    fileprivate func setupButtonLayout(){
        let replyButtonContainer = UIView()
        replyButtonContainer.backgroundColor = UIColor.clear
        
        let retweetButtonContainer = UIView()
        retweetButtonContainer.backgroundColor = UIColor.clear
        
        let likeButtonContainer = UIView()
        likeButtonContainer.backgroundColor = UIColor.clear
        
        let sendMsgButtonContainer = UIView()
        sendMsgButtonContainer.backgroundColor = UIColor.clear
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainer, retweetButtonContainer, likeButtonContainer, sendMsgButtonContainer])
        buttonStackView.axis = UILayoutConstraintAxis.horizontal
        buttonStackView.distribution = UIStackViewDistribution.fillEqually
        
        addSubview(buttonStackView)
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(sendMsgButton)
        
        replyButton.anchor(replyButtonContainer.topAnchor, left: replyButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 25, heightConstant: 25)
        retweetButton.anchor(retweetButtonContainer.topAnchor, left: retweetButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 25, heightConstant: 25)
        likeButton.anchor(likeButtonContainer.topAnchor, left: likeButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 25, heightConstant: 25)
        sendMsgButton.anchor(sendMsgButtonContainer.topAnchor, left: sendMsgButtonContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 25, heightConstant: 25)
    }
    
}
