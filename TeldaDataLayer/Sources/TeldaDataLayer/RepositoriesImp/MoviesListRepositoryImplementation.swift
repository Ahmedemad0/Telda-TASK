//
//  MoviesListRepositoryImplementation.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation
import TeldaNetworkLayer
import TeldaDomainLayer
import TeldaCommon

public final class MoviesListRepositoryImplementation: MoviesListRepositoryProtocol {
    
    private let networking: NetworkDispatcher
    
    public init(networking: NetworkDispatcher) {
        self.networking = networking
    }
    
    public func getMoviesList() async throws -> MoviesEntity {
        let request = MoviesListRequest()
        print(APIKeyManager.apiKey)
        print(request.queryParameters)
        let data = try await self.networking.dispatch(request)
        return data.toDomain()
    }
        
    public func searchMoviesList(query: String) async throws -> MoviesEntity {
        let request = SearchMoviesRequest(query: query)
        let data = try await self.networking.dispatch(request)
        return data.toDomain()
    }
    
}
