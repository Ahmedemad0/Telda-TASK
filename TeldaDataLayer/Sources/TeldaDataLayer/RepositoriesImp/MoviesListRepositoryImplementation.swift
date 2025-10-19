//
//  MoviesListRepositoryImplementation.swift
//  TeldaDataLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation
import TeldaNetworkLayer

public final class MoviesListRepositoryImplementation {
    
    private let networking: NetworkDispatcher
    
    public init(networking: NetworkDispatcher) {
        self.networking = networking
    }
    
    public func getMoviesList() async throws -> MoviesResponse {
        let request = MoviesListRequest()
        let data = try await self.networking.dispatch(request)
        return data
    }
        
    public func searchMoviesList() async throws -> MoviesResponse {
        let request = SearchMoviesRequest()
        let data = try await self.networking.dispatch(request)
        return data
    }
    
}
