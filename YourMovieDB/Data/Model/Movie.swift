//
//  Movie.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/6/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper

struct Movie: BaseModel {
    var popularity = 0.0
    var voteCount = 0
    var video = false
    var posterPath = ""
    var id = 0
    var adult = false
    var backdropPath = ""
    var originalLanguage = ""
    var originalTitle = ""
    var genreId = [Int]()
    var title = ""
    var voteAverage = 0.0
    var overView = ""
    var releaseDate: Date?

    init() { }

    init?(map: Map) {
        mapping(map: map)
    }

    mutating func mapping(map: Map) {
        popularity <- map["popularity"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        posterPath <- map["poster_path"]
        id <- map["id"]
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreId <- map["genre_ids"]
        title <- map["title"]
        voteAverage <- map["vote_average"]
        overView <- map["overview"]
        releaseDate <- (map["release_date"], DateTransform())
    }
}
