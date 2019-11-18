//
//  MovieRepository.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

protocol MovieRepositoryType {
    func getPopularMovie(input: HomeRequest) -> Observable<[Movie]>
    func getTopRateMovie(input: HomeRequest) -> Observable<[Movie]>
    func getupComingMovie(input: HomeRequest) -> Observable<[Movie]>
    func getNowPlayingMovie(input: HomeRequest) -> Observable<[Movie]>
    func getDetail(input: MovieRequest) -> Observable<MovieDetail>
    func searchMovie(input: SearchRequest) -> Observable<[Movie]>
    func getGenres(input: GenresRequest) -> Observable<[Genre]>

}

final class MovieRepository: MovieRepositoryType {
    private let apiService = APIService.shared

    func getPopularMovie(input: HomeRequest) -> Observable<[Movie]> {
        return apiService.request(input: input)
            .map { (response: HomeResponse) -> [Movie] in
                return response.movies
        }
    }

    func getTopRateMovie(input: HomeRequest) -> Observable<[Movie]> {
        return apiService.request(input: input)
            .map { (response: HomeResponse) -> [Movie] in
                return response.movies
        }
    }

    func getupComingMovie(input: HomeRequest) -> Observable<[Movie]> {
        return apiService.request(input: input)
            .map { (response: HomeResponse) -> [Movie] in
                return response.movies
        }
    }

    func getNowPlayingMovie(input: HomeRequest) -> Observable<[Movie]> {
        return apiService.request(input: input)
            .map { (response: HomeResponse) -> [Movie] in
                return response.movies
        }
    }

    func getGenres(input: GenresRequest) -> Observable<[Genre]> {
        return apiService.request(input: input)
            .map { (response: GenreResponse) -> [Genre] in
                return response.genres
        }
    }

    func getDetail(input: MovieRequest) -> Observable<MovieDetail> {
        return apiService.request(input: input)
            .map { (response: MovieDetailResponse) -> MovieDetail in
                guard let movie = response.movie else {
                    return MovieDetail()
                }
                return movie
        }
    }

    func searchMovie(input: SearchRequest) -> Observable<[Movie]> {
        return apiService.request(input: input)
            .map { (response: SearchResponse) -> [Movie] in
                return response.movies
        }
    }
}
