//
//  HomeUseCase.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeUseCaseType {
    func getUpcoming() -> Observable<[Movie]>
    func getPupolar() -> Observable<[Movie]>
    func getTopRate() -> Observable<[Movie]>
    func getNowPlaying() -> Observable<[Movie]>
    func getGenres() -> Observable<[Genre]>
    func getDetailMovie(movieId: Int) -> Observable<MovieDetail>
    func getSearchMovie(search: String) -> Observable<[Movie]>
}

struct HomeUseCase: HomeUseCaseType {
    var repository = MovieRepository()

    func getUpcoming() -> Observable<[Movie]> {
        return repository.getupComingMovie(input: HomeRequest(Urls.upComingURL))
    }

    func getPupolar() -> Observable<[Movie]> {
        return repository.getPopularMovie(input: HomeRequest(Urls.popularURL))
    }

    func getTopRate() -> Observable<[Movie]> {
        return repository.getTopRateMovie(input: HomeRequest(Urls.toprateURL))
    }

    func getNowPlaying() -> Observable<[Movie]> {
        return repository.getNowPlayingMovie(input: HomeRequest(Urls.nowPlayURL))
    }

    func getSearchMovie(search: String) -> Observable<[Movie]> {
        return repository.searchMovie(input: SearchRequest(url: Urls.searchMovieQuery, search: search, page: Constants.defaultPage))
    }

    func getGenres() -> Observable<[Genre]> {
        return repository.getGenres(input: GenresRequest(urlPath: Urls.searchMovieGenres))
    }

    func getDetailMovie(movieId: Int) -> Observable<MovieDetail> {
        return repository.getDetail(input: MovieRequest(url: Urls.searchMovieQuery, movieId: movieId))
    }

}
