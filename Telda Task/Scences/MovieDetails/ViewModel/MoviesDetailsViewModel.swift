//
//  MoviesDetailsViewModel.swift
//  Telda Task
//
//  Created by Ahmed Emad on 19/10/2025.
//
import Foundation
import TeldaDomainLayer

class MoviesDetailsViewModel {
    
    private let repo: MovieDetailsRepositoryProtocol

    @Published private(set) var movieDetails: MovieDetailsEntity?
    @Published private(set) var similarMovies: [MovieEntity] = []
    @Published private(set) var movieCast: [CastMemberEntity] = []
    @Published private(set) var isFavorite: Bool = false

    let movieId: Int
    init(repo: MovieDetailsRepositoryProtocol, movieId: Int) {
        self.repo = repo
        self.movieId = movieId
        configureIsFavorite()
        getMovieDetails(id: movieId)
        getSimilarMovies(id: movieId)
        getMovieCast(id: movieId)
    }
    
    private func getMovieDetails(id: Int) {
        Task {
            movieDetails = try? await repo.getMovieDetails(id: id)
        }
    }
    
    private func getSimilarMovies(id: Int) {
        Task {
            let response = try? await repo.getSimilarMovies(id: id)
            similarMovies = Array(response?.results?.prefix(5) ?? [])
        }
    }
    
    private func getMovieCast(id: Int) {
        Task {
            let response = try? await repo.getMovieCast(id: id)
            movieCast = response?.cast ?? []
        }
    }
    
    private func configureIsFavorite() {
        isFavorite = UserDefaultsManager.shared.favouriteIDs.contains(movieId)
    }
    
    func toggleIsFavorite() {
        isFavorite.toggle()
        var favouriteIDs = UserDefaultsManager.shared.favouriteIDs

        if favouriteIDs.contains(movieId) {
            favouriteIDs.remove(movieId)
        } else {
            favouriteIDs.insert(movieId)
        }

        UserDefaultsManager.shared.favouriteIDs = favouriteIDs
    }

}
