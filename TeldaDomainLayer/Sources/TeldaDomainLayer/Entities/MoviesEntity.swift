//
//  MoviesEntity.swift
//  TeldaDomainLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//

import UIKit

public struct MoviesEntity {
    public var page: Int?
    public var results: [MovieEntity]?
    public var totalPages: Int?
    public var totalResults: Int?

    public init(page: Int? = nil, results: [MovieEntity]? = nil, totalPages: Int? = nil, totalResults: Int? = nil) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

public struct MovieEntity: Identifiable {
    public var id: Int?
    public var overview: String?
    public var posterPath: String?
    public var releaseDate: String?
    public var title: String?
    
    public var posterURL: String {
        "https://image.tmdb.org/t/p/w200\(posterPath ?? "")"
    }
    
    public init(id: Int? = nil, overview: String? = nil, posterPath: String? = nil, releaseDate: String? = nil, title: String? = nil) {
        self.id = id
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
    }
}
