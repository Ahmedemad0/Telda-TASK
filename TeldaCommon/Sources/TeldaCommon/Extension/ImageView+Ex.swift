//
//  ImageView+Ex.swift
//  TeldaCommon
//
//  Created by Ahmed Emad on 19/10/2025.
//

import UIKit

public extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
