//
//  GradientView.swift
//  Movies
//
//  Created by Nikema Prophet on 5/22/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {

    // Gradient layer that is added on top of the view
    var gradientLayer:CAGradientLayer = CAGradientLayer()
    // Top color of the gradient layer
    @IBInspectable var topColor: UIColor = UIColor(red: 253.0/255.0, green: 56.0/255.0, blue: 102.0/255.0, alpha: 0.9)
    
    // Bottom color of the gradient layer
    @IBInspectable var bottomColor: UIColor = UIColor(red: 250.0/255.0, green: 26.0/255.0, blue: 53.0/255.0, alpha: 0.9)
    
    @IBInspectable var shadowColor: UIColor = UIColor.blackColor()
    @IBInspectable var shadowRadius: CGFloat = 5.0
    @IBInspectable var shadowOpacity: Float = 0.7
    
    

    override class func layerClass() -> AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.CGColor, bottomColor.CGColor]
        self.layer.shadowColor = shadowColor.CGColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).CGPath

    }
}