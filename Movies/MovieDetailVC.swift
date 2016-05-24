//
//  MovieDetailVC.swift
//  Movies
//
//  Created by Nikema Prophet on 5/24/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

   }
