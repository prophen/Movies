//
//  Constants.swift
//  Movies
//
//  Created by Nikema Prophet on 5/23/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import Foundation

let OMDB_BASE = "http://www.omdbapi.com/?t="
// append movie title the add parameters for the full URL
// http://www.omdbapi.com/?t=Spirited+Away&y=&plot=short&r=json
let OMDB_PARAMETERS = "&plot=short&r=json"

// finish the url with IMDb Id
let IMDB_BASE = "http://www.IMDb.com/title/"

// Base + IMDB ID + API Key
let TMDB_BASE = "https://api.themoviedb.org/3/find/"
//let TMDB_PARAMETERS = "&query="
let TMDB_APPEND_TO_IMDB_ID = "?external_source=imdb_id&api_key="

// Base + Width + Path to Image
let IMG_BASE = "http://image.tmdb.org/t/p/"
let IMG_WIDTH_92 = "w92"
let IMG_WIDTH_154 = "w154"

