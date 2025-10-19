//
//  MoviesDetailsViewController.swift
//  Telda Task
//
//  Created by Ahmed Emad on 19/10/2025.
//

import UIKit
import Combine
import TeldaDomainLayer
import TeldaCommon

class MoviesDetailsViewController: UIViewController {

    @IBOutlet weak private var imageIcon: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var releaseDate: UILabel!
    @IBOutlet weak private var revenueLabel: UILabel!
    @IBOutlet weak private var statusLabel: UILabel!
    @IBOutlet weak private var tagLineLabel: UILabel!
    @IBOutlet weak private var overviewLabel: UILabel!
    @IBOutlet weak private var similarMoviesCollectionView: UICollectionView!
    @IBOutlet weak private var castCollectionView: UICollectionView!
    
    @IBOutlet weak var addToWatchListButton: UIButton!
    
    private let viewModel: MoviesDetailsViewModel
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: MoviesDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSimilarMoviesCollectionView()
        configureMovieCastCollectionView()
        bindViewModel()
    }

    private func configure(for model: MovieDetailsEntity) {
        imageIcon.loadImage(from: model.posterURL)
        titleLabel.text = model.title
        releaseDate.text = model.releaseDate
        revenueLabel.text = model.revenue
        statusLabel.text = model.status
        tagLineLabel.text = model.tagline
        overviewLabel.text = model.overview
    }
    
    private func configureSimilarMoviesCollectionView() {
        similarMoviesCollectionView.delegate = self
        similarMoviesCollectionView.dataSource = self
        similarMoviesCollectionView.register(cells: [MovieDetailsCollectionViewCell.self])
    }
     
    private func configureMovieCastCollectionView() {
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.register(cells: [MovieDetailsCollectionViewCell.self])
    }
    
    private func bindViewModel() {
        viewModel.$movieDetails
           .receive(on: DispatchQueue.main)
           .sink { [weak self] details in
               guard let self, let details else { return }
               configure(for: details)
           }
           .store(in: &cancellables)
        
        viewModel.$similarMovies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.similarMoviesCollectionView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$movieCast
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.castCollectionView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$isFavorite
            .receive(on: RunLoop.main)
            .sink { [weak self] isFav in
                self?.addToWatchListButton.setTitle(
                    isFav ? "Remove from Watchlist" : "Add to Watchlist",
                    for: .normal
                )
            }
            .store(in: &cancellables)
    }
    
    @IBAction func addToWatchButtonTapped(_ sender: Any) {
        viewModel.toggleIsFavorite()
    }
}

extension MoviesDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView == similarMoviesCollectionView ? viewModel.similarMovies.count : viewModel.movieCast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as MovieDetailsCollectionViewCell
        let url = collectionView == similarMoviesCollectionView ? viewModel.similarMovies[indexPath.row].posterURL :  viewModel.movieCast[indexPath.row].posterURL
        cell.update(for: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 100)
    }
}
