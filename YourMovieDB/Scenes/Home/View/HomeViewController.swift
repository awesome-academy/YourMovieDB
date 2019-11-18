//
//  HomeViewController.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import RxCocoa
import RxDataSources
import RxSwift

final class HomeViewController: UIViewController, BindableType {
    @IBOutlet private weak var menuButton: UIButton!
    @IBOutlet private weak var homeTable: UITableView!
    @IBOutlet private weak var searchButton: UIButton!

    var viewModel: HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        homeTable.do {
            $0.estimatedRowHeight = 155
            $0.delegate = self
            $0.register(cellType: MovieTableViewCell.self)
        }
        self.navigationController?.do {
            $0.isNavigationBarHidden = true
            $0.navigationBar.isTranslucent = false
        }
    }

    func bindViewModel() {
        let input = HomeViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel?.transform(input: input)

        let dataSource = RxTableViewSectionedReloadDataSource<HomeDataSection>(configureCell: { (_, table, indexPath, item) -> UITableViewCell in
            let cell = table.dequeueReusableCell(for: indexPath, cellType: MovieTableViewCell.self).then {
                $0.bindData(data: item)
            }
            return cell
        })
        dataSource.titleForHeaderInSection = { data, index in
            return data.sectionModels[index].header
        }
    }
}

extension HomeViewController: UITableViewDelegate {
}
