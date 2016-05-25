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

}
