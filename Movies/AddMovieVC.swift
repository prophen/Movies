//
//  AddMovieVC.swift
//  Movies
//
//  Created by Nikema Prophet on 5/23/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class AddMovieVC: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var posterImg: RoundedImages!
    
    var movie = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func previewPosterBtnPressed(sender: AnyObject) {
        

    }
    
    @IBAction func addBtnPressed(sender: AnyObject) {
        if titleField.text != "" {
            movie.title = titleField.text!
            
            if descField.text != "" {
                movie.desc = descField.text!
            }
            
             movie.downloadMovieDetails ({ () -> () in
                
                }, movie: movie)
            
            
            dismissViewControllerAnimated(true, completion: nil)
        }
       
        
           
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
