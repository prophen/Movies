//
//  Movie.swift
//  Movies
//
//  Created by Nikema Prophet on 5/23/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import Foundation
import Alamofire

class Movie: NSObject, NSCoding {
    
    private var _title: String!
    private var _desc: String!
    private var _plot: String!
    private var _detailImgPath: String!
    private var _imdbUrl: String!
    private var _imdbID: String!
    let group = dispatch_group_create()
    
    var title: String {
        get {
        return _title
        }
        set {
            _title = newValue
        }
    }
    
    var desc: String {
        get {
            if _desc == nil {
                _desc = "\(_title.capitalizedString) is one of my favorite movies!"
            }
            return _desc
        }
        set {
            _desc = newValue
        }
    }
    
    var plot: String {
        get {
            if _plot == nil  {
                _plot = ""
            }
            return _plot
        }
        set {
            _plot = newValue
        }
    }
    var imdbID: String {
        get {
            if _imdbID == nil  {
                _imdbID = ""
            }
            return _imdbID
        }
        set {
            _imdbID = newValue
        }
    }
    var detailImgPath: String {
        get {
            if _detailImgPath == nil {
                let img = UIImage(named: "default-image")
                
                let detailImgPath = DataService.instance.saveImageAndCreatePath(img!)
                self._detailImgPath = detailImgPath
                

            }
            return _detailImgPath
        }
        set {
            _detailImgPath = newValue
        }
    }
    
    var imdbUrl: String {
        get {
            if _imdbUrl == nil {
                _imdbUrl = "http://www.IMDb.com"
            }
            return _imdbUrl
        }
        set {
            _imdbUrl = newValue
        }
    }
    
    
    init(title: String) {
        _title = title

    }
    override init() {
        
    }
    
    required convenience init?(coder aDecoder:NSCoder){
        self.init()
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._desc = aDecoder.decodeObjectForKey("desc") as? String
        self._detailImgPath = aDecoder.decodeObjectForKey("detailImgPath") as? String
        self._plot = aDecoder.decodeObjectForKey("plot") as? String
        self._imdbUrl = aDecoder.decodeObjectForKey("imdbUrl") as? String
        self._imdbID = aDecoder.decodeObjectForKey("imdbID") as? String
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._detailImgPath, forKey: "detailImgPath")
        aCoder.encodeObject(self._desc, forKey: "desc")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._plot, forKey: "plot")
        aCoder.encodeObject(self._imdbUrl, forKey:  "imdbUrl")
        aCoder.encodeObject(self._imdbID, forKey:  "imdbID")
    }

    func getPosterImg(imdbID: String) -> String{
        let tmdbUrl = "\(TMDB_BASE)\(imdbID)\(TMDB_APPEND_TO_IMDB_ID)\(API_KEY)"
        let imgUrl = NSURL(string: tmdbUrl)!

        Alamofire.request(.GET, imgUrl).responseJSON {
            response in
            let result = response.result
            if (result.value != nil) {
             
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    if let results = dict["movie_results"] as? [Dictionary<String, AnyObject>] where results.count > 0 {
                        if let poster_path = results[0]["poster_path"] as? String {
                            let imageUrl = "\(IMG_BASE)w300\(poster_path)"
                            print(imageUrl)
                            var img: UIImage!
                            let url = NSURL(string: imageUrl)!
                            if let data = NSData(contentsOfURL: url) {
                                img = UIImage(data: data)
                                let detailImgPath = DataService.instance.saveImageAndCreatePath(img)
                                self._detailImgPath = detailImgPath
                                dispatch_group_leave(self.group)
                            }
                        }
                    }
                }
            }
        }
        
         return detailImgPath
    }
    
    func downloadMovieDetails(movie:Movie){
        

        self._title = movie.title
        self._desc = movie.desc
        let requestTitle = movie.title.stringByReplacingOccurrencesOfString(" ", withString: "+")
        let omdbUrl = "\(OMDB_BASE)\(requestTitle)\(OMDB_PARAMETERS))"
        let url = NSURL(string: omdbUrl)!
        
        dispatch_group_enter(group)
        Alamofire.request(.GET, url).responseJSON {
            response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let plot = dict["Plot"] as? String {
                    self._plot = plot
                }
                if let imdbId = dict["imdbID"] as? String {
                    self._imdbID = imdbId
                    self._imdbUrl  = "\(IMDB_BASE)\(imdbId)"
                    dispatch_group_leave(self.group)
                    
                    dispatch_group_enter(self.group)
                    self._detailImgPath = self.getPosterImg(imdbId)
                    
                    
                    dispatch_group_notify(self.group, dispatch_get_main_queue()) {
                        print("both requests done")
                     DataService.instance.addMovie(self)
                    }
                } else {
                    DataService.instance.addMovie(self)
                }
            }
        
        }
 
    }
}
