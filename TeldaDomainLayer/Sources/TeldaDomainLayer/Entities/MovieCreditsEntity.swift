//
//  MovieCreditsEntity.swift
//  TeldaDomainLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation

public struct MovieCreditsEntity {
    public var cast: [CastMemberEntity]
    
    public init(cast: [CastMemberEntity]) {
        self.cast = cast
    }
}

public struct CastMemberEntity: Codable {
    public var name: String
    public var profilePath: String
    
    public var posterURL: String {
        "https://image.tmdb.org/t/p/w200\(profilePath)"
    }
    
    public init(name: String, profilePath: String) {
        self.name = name
        self.profilePath = profilePath
    }
}
