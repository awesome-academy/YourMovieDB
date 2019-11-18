//
//  URLs.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/5/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

enum Urls {
    private static var apiBaseURL = "https://api.themoviedb.org/3"
    static let searchMovieQuery = apiBaseURL + "/search/movie"
    static let toprateURL = apiBaseURL + "/movie/top_rated"
    static let upComingURL = apiBaseURL + "/movie/upcoming"
    static let popularURL = apiBaseURL + "/movie/popular"
    static let nowPlayURL = apiBaseURL + "/movie/now_playing"
    static let searchMovieGenres = apiBaseURL + "/discover/movie"

    static let posterUrl = "https://image.tmdb.org/t/p/w185"
    static let backdropUrl = "https://image.tmdb.org/t/p/w500"
    static let profileUrl = "https://image.tmdb.org/t/p/w154"
}
