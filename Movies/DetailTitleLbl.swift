//
//  DetailTitleLbl.swift
//  Movies
//
//  Created by Nikema Prophet on 5/25/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class DetailTitleLbl: UILabel {

    override func awakeFromNib() {
        layer.cornerRadius = 10.0
        clipsToBounds = true
    }
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
}
