//
//  RoundedImages.swift
//  Fav-Movies
//
//  Created by Nikema Prophet on 5/22/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class RoundedImages: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
