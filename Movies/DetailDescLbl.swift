//
//  DetailDescLbl.swift
//  Movies
//
//  Created by Nikema Prophet on 5/25/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class DetailDescLbl: UILabel {

    override func awakeFromNib() {
        layer.cornerRadius = 7.0
      
        clipsToBounds = true
    }
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
}
