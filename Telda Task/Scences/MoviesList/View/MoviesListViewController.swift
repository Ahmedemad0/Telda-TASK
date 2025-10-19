//
//  MoviesListViewController.swift
//  Telda Task
//
//  Created by Ahmed Emad on 19/10/2025.
//

import UIKit
import TeldaDomainLayer
import TeldaCommon
import Combine

final class MoviesListViewController: UIViewController {

    @IBOutlet weak var searchTF: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    private let viewModel: MoviesListViewModel
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        searchTF.delegate = self

        bindViewModel()
    }

    private func configureTableView() {
        tableView.registerCellNib(cellClass: MovieCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func bindViewModel() {
       viewModel.$movies
           .receive(on: DispatchQueue.main)
           .sink { [weak self] _ in
               self?.tableView.reloadData()
           }
           .store(in: &cancellables)
   }

}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCell = tableView.dequeue()
        cell.update(for: viewModel.movies[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension MoviesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Task { @MainActor in
            viewModel.updateQuery(searchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        Task { @MainActor in
            viewModel.updateQuery(searchBar.text ?? "")
        }
    }
}
