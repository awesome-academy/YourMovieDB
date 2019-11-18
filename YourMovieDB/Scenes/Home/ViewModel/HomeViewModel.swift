//
//  HomeViewModel.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/12/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

struct HomeViewModel {
    var navigator: HomeNavigatorType
    var useCase: HomeUseCaseType
}

extension HomeViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let upComing: Driver<[Movie]>
        let popular: Driver<[Movie]>
        let topRate: Driver<[Movie]>
        let nowPlaying: Driver<[Movie]>
    }

    func transform(input: HomeViewModel.Input) -> HomeViewModel.Output {
        let errorTracker = ErrorTracker()

        let upComing = input.loadTrigger
            .flatMapLatest { _ in
                self.useCase
                    .getUpcoming()
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
            }

        let popular = input.loadTrigger
            .flatMapLatest { _ in
                self.useCase
                    .getPupolar()
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
            }

        let topRate = input.loadTrigger
            .flatMapLatest { _ in
                self.useCase
                    .getTopRate()
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
            }

        let nowPlaying = input.loadTrigger
            .flatMapLatest { _ in
                self.useCase
                    .getNowPlaying()
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
            }

        return Output(upComing: upComing,
                      popular: popular,
                      topRate: topRate,
                      nowPlaying: nowPlaying)
    }
}
