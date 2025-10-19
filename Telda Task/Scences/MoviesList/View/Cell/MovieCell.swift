//
//  MovieCell.swift
//  Telda Task
//
//  Created by Ahmed Emad on 19/10/2025.
//

import UIKit
import TeldaDomainLayer
import TeldaCommon

class MovieCell: UITableViewCell {

    @IBOutlet weak private var movieImage: UIImageView!
    @IBOutlet weak private var movieTitle: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var favoriteImage: UIImageView!
    @IBOutlet weak private var overviewLabel: UILabel!
    
    func update(for model: MovieEntity) {
        movieTitle.text = model.title
        dateLabel.text = model.releaseDate
        overviewLabel.text = model.overview
        favoriteImage.tintColor = model.favoriteTintColor
        movieImage.loadImage(from: model.posterURL)
    }
}
