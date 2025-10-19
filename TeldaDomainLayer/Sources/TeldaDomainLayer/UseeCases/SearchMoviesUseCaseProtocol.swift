//
//  SearchMoviesUseCaseProtocol.swift
//  TeldaDomainLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


import Foundation

public protocol MoviesListUseCaseProtocol {
    func execute(query: String) async throws -> MoviesEntity
}

public final class MoviesListUseCase: MoviesListUseCaseProtocol {
    
    private let repository: MoviesListRepositoryProtocol
    
    public init(repository: MoviesListRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(query: String) async throws -> MoviesEntity {
        
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return try await repository.getMoviesList()
        }
        
        return try await repository.searchMoviesList(query: query)
    }
}
