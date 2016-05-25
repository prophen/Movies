//
//  MovieDetailVC.swift
//  Movies
//
//  Created by Nikema Prophet on 5/24/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var posterImg: RoundedImages!
    @IBOutlet weak var descLbl: DetailDescLbl!
    @IBOutlet weak var imdbLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = movie.title.capitalizedString
        posterImg.image = DataService.instance.imageForPath(movie.detailImgPath)
        descLbl.text = movie.desc
        plotLbl.text = movie.plot
        imdbLbl.text = movie.imdbUrl
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

   }
