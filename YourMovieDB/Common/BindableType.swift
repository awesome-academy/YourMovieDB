//
//  BindableType.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//
import UIKit
import RxSwift

public protocol BindableType: class {
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }

    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    public func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
