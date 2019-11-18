//
//  HomeRequest.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/6/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class HomeRequest: BaseRequest {
    required init(_ urlPath: String) {
        super.init(url: urlPath, requestType: .get, body: [:])
    }
}
