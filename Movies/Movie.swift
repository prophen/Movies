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
    
    
    var title: String {
        return _title
    }
    
    var desc: String {
        return _desc
    }
    
    var plot: String {
        return _plot
    }
    
    var detailImgPath: String {
        return _detailImgPath
    }
    
    var imdbUrl: String {
        return _imdbUrl
    }
    
    
    init(title: String, desc: String, detailImgPath: String) {
        _title = title
        _desc = desc
        _detailImgPath = detailImgPath
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder:NSCoder){
        self.init()
        self._detailImgPath = aDecoder.decodeObjectForKey("detailImgPath") as? String
        self._desc = aDecoder.decodeObjectForKey("desc") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._detailImgPath, forKey: "detailImgPath")
        aCoder.encodeObject(self._desc, forKey: "desc")
        aCoder.encodeObject(self._title, forKey: "title")
    }

}