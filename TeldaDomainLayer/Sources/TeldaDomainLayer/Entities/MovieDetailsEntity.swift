//
//  MovieDetailsEntity.swift
//  TeldaDomainLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation

public struct MovieDetailsEntity {
    public var backdropPath: String
    public var id: Int
    public var overview: String
    public var releaseDate: String
    public var revenue: String
    public var status: String
    public var tagline: String
    public var title: String
    
    public var posterURL: String {
        "https://image.tmdb.org/t/p/w200\(backdropPath)"
    }
    
   
    
    public init(backdropPath: String, id: Int, overview: String, releaseDate: String, revenue: String, status: String, tagline: String, title: String) {
        self.backdropPath = backdropPath
        self.id = id
        self.overview = overview
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.status = status
        self.tagline = tagline
        self.title = title
    }
}
