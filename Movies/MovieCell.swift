//
//  MovieCell.swift
//  Movies
//
//  Created by Nikema Prophet on 5/23/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var imdbBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(movie: Movie) {
        titleLbl.text = movie.title.capitalizedString
        descLbl.text = movie.desc
        let imdbUrl: String = movie.imdbUrl.stringByReplacingOccurrencesOfString("http://www.", withString: "")
        imdbBtn.setTitle(imdbUrl, forState:.Normal )
        thumbImg.image = DataService.instance.imageForPath(movie.detailImgPath)
    }
    
   
}
