//
//  HomeDataSectioon.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift

struct HomeDataSection {
    var header: String
    var items: [Item]
}

extension HomeDataSection: SectionModelType {
    typealias Item = Movie

    init(original: HomeDataSection, items: [Item]) {
        self = original
        self.items = items
    }
}
