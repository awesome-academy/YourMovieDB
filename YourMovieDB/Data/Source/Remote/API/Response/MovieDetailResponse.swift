//
//  MovieDetailResponse.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper

final class MovieDetailResponse: Mappable {
    var movie: MovieDetail?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        movie <- map[""]
    }
}
