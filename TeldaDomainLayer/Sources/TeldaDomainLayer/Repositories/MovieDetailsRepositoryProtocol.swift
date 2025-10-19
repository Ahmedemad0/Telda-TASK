//
//  MovieDetailsRepositoryProtocol.swift
//  TeldaDomainLayer
//
//  Created by Ahmed Emad on 19/10/2025.
//


public protocol MovieDetailsRepositoryProtocol {
    func getMovieDetails(id: Int) async throws -> MovieDetailsEntity
}