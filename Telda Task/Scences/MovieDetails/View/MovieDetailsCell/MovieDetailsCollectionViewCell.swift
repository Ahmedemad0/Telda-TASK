//
//  MovieDetailsCollectionViewCell.swift
//  Telda Task
//
//  Created by Ahmed Emad on 19/10/2025.
//

import UIKit
import TeldaDomainLayer

class MovieDetailsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    

    func update(for url: String) {
        imageView.loadImage(from: url)
    }
}
