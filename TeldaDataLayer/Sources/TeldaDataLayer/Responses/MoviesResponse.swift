//
//  MoviesResponse.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation

// MARK: - MoviesResponse
public struct MoviesResponse: Codable {
    public var page: Int?
    public var results: [Movie]?
    public var totalPages: Int?
    public var totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    public init() { }
}

// MARK: - Movie
public struct Movie: Codable {
    public var id: Int?
    public var overview: String?
    public var posterPath: String?
    public var releaseDate: String?
    public var title: String?

    enum CodingKeys: String, CodingKey {
        case id, overview, title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
    
    public init() { }
}
