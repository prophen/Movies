//
//  RoundedBtn.swift
//  Movies
//
//  Created by Nikema Prophet on 5/26/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class RoundedBtn: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    

}
