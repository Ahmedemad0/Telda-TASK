//
//  MovieCreditsResponse.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation
import TeldaDomainLayer

public struct MovieCreditsResponse: Codable {
    public var cast: [CastMember]?
}

public struct CastMember: Codable {
    public var name: String?
    public var profilePath: String?


    enum CodingKeys: String, CodingKey {
        case name
        case profilePath = "profile_path"
    }
}

public extension MovieCreditsResponse {

    func toDomain() -> MovieCreditsEntity {
        let castEntities = self.cast?.compactMap {
            return CastMemberEntity(
                name: $0.name ?? "Unknown Actor",
                profilePath: $0.profilePath ?? ""
            )
        } ?? []
        
        return MovieCreditsEntity(cast: castEntities)
    }
}
