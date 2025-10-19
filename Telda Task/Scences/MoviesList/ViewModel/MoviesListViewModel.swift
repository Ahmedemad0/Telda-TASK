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
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?

    init(useCase: MoviesListUseCaseProtocol) {
        self.useCase = useCase
        Task {
            await getMovies()
        }
    }

    func updateQuery(_ query: String) {
        // Cancel any in-flight debounce task and start a new one
        searchTask?.cancel()
        searchTask = Task { [weak self] in
            guard let self else { return }
            // Debounce window (e.g., 400ms)
            try? await Task.sleep(nanoseconds: 400_000_000)
            await self.getMovies(query: query)
        }
    }

    func getMovies(query: String = "") async {
        isLoading = true
        errorMessage = nil
        do {
            let response = try await useCase.execute(query: query)
            movies = response.results ?? []
            
        } catch {
            errorMessage = error.localizedDescription
            movies = []
        }
        isLoading = false
    }
}

