//
//  MovieTableViewCell.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable
import Then

final class MovieTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var layerView: UIView!
    @IBOutlet private weak var imageWrap: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }

    private func configureView() {
        layerView.do {
            $0.shadowOffset = .zero
            $0.shadowColor = .lightGray
            $0.shadowOpacity = 0.7
        }
        imageWrap.do {
            $0.shadowOffset = .zero
            $0.shadowColor = .lightGray
            $0.shadowOpacity = 0.7
        }
    }
    
    func bindData(data: Movie) {
        titleLabel.text = data.title
    }
}
