//
//  MovieDetailsResponse.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation
import TeldaDomainLayer

public struct MovieDetailsResponse: Codable, Identifiable {
    public var backdropPath: String?
    public var id: Int?
    public var overview: String?
    public var releaseDate: String?
    public var revenue: Int?
    public var status: String?
    public var tagline: String?
    public var title: String?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case id, overview, revenue
        case status, tagline, title
    }
}

public extension MovieDetailsResponse {
    func toDomain() -> MovieDetailsEntity {
        return MovieDetailsEntity(
            backdropPath: self.backdropPath ?? "",
            id: self.id ?? 0,
            overview: self.overview ?? "No overview available.",
            releaseDate: self.releaseDate ?? "N/A",
            revenue: self.revenue ?? 0,
            status: self.status ?? "Unknown",
            tagline: self.tagline ?? "",
            title: self.title ?? "No title available"
        )
    }
}
