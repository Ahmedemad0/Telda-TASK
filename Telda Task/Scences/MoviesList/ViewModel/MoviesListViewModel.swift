//
//  MoviesListViewModel.swift
//  Telda Task
//
//  Created by Ahmed Emad on 19/10/2025.
//

import Foundation
import TeldaDomainLayer
import TeldaCommon

@MainActor
final class MoviesListViewModel {
    
    private let useCase: MoviesListUseCaseProtocol
    private var searchTask: Task<Void, Never>?

    @Published private(set) var movies: [MovieEntity] = []
    @Published private(set) var errorMessage: String?

    init(useCase: MoviesListUseCaseProtocol) {
        self.useCase = useCase
        Task {
            await getMovies()
        }
    }

    func updateQuery(_ query: String) {
        
        searchTask?.cancel()
        searchTask = Task { [weak self] in
            guard let self else { return }
            
            try? await Task.sleep(nanoseconds: 400_000_000)
            await self.getMovies(query: query)
        }
    }

    func getMovies(query: String = "") async {
        do {
            let response = try await useCase.execute(query: query)
            movies = response.results ?? []
        } catch {
            errorMessage = error.localizedDescription
            movies = []
        }
    }
}

