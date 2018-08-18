//
//  RoundButton.swift
//  emergencyCall
//
//  Created by Techsviewer on 6/26/18.
//  Copyright © 2018 Techsviewer. All rights reserved.

import UIKit

@IBDesignable public class RoundButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.02 * bounds.size.width
        clipsToBounds = true
    }
}
