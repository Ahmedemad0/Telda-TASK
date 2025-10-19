//
//  MoviesListRepositoryProtocol.swift
//  TeldaDomainLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


public protocol MoviesListRepositoryProtocol {
    func getMoviesList() async throws -> MoviesEntity
    func searchMoviesList(query: String) async throws -> MoviesEntity
}
