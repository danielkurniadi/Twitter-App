//
//  util.swift
//  twitter-app
//
//  Created by Student 3 on 29/7/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit

extension String {
    func frameHeight(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin),
                                            attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func frameWidth(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin),
                                            attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    func frameSize(withConstrainedWidth width: CGFloat, withConstrainedHeight height: CGFloat, font: UIFont) -> CGRect {
        let constraintRect = CGSize(width: width, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin),
                                            attributes: [.font: font], context: nil)
        return boundingBox
    }

}

extension UIView{
    
    func addContraintsWithFormat(hFormat: String, vFormat: String, views: UIView...){
        var formatDict = [String : UIView]()
        
        for (index,viewItem) in views.enumerated(){
            formatDict["v\(index)"] = viewItem
            viewItem.translatesAutoresizingMaskIntoConstraints = false
        }
        if hFormat != ""{
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: hFormat, options: NSLayoutFormatOptions(), metrics: nil, views: formatDict))
        }
        if vFormat != ""{
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vFormat, options: NSLayoutFormatOptions(), metrics: nil, views: formatDict))
        }
    }
}
