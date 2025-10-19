//
//  MovieDetailsRepositoryImplementation.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation
import TeldaNetworkLayer
import TeldaDomainLayer

public final class MovieDetailsRepositoryImplementation: MovieDetailsRepositoryProtocol {
    
    private let networking: NetworkDispatcher
    
    public init(networking: NetworkDispatcher) {
        self.networking = networking
    }

    public func getMovieDetails(id: Int) async throws -> MovieDetailsEntity {
        let request = MovieDetailsRequest(id: id)
        let data = try await self.networking.dispatch(request)
        return data.toDomain()
    }
    
}
