//
//  MovieListVC.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 01/03/22.
//

import UIKit

class MovieListVC: UIViewController {

    enum Section { case main }

    var username: String!
    var movies: [Movie] = []
    var filteredMovies: [Movie] = []
    var page = 1
    var hasMoreMovies = true
    var isSearching = false
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureCollectionView()
        getPopularMovies(page: page)
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
    }
    
    func configureSearchController() {
        let searchController                    = UISearchController()
        searchController.searchResultsUpdater   = self
        searchController.searchBar.delegate     = self
        searchController.searchBar.placeholder  = "Procure um filme"
        navigationItem.searchController         = searchController
    }
    
    func getPopularMovies(page: Int) {
        showLoadingView()
        NetworkManager.shared.getPopularMovies(page: page) { [weak self] result in
            
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
                
            case .success(let movies):
                if movies.count < 20 { self.hasMoreMovies = false }
                self.movies.append(contentsOf: movies)
                self.updateData(on: self.movies)
                
            case .failure(let error):
                self.presentMSAlertOnMainThread(title: "Ops... Algo deu errado", message: error.rawValue, buttonTitle: "OK")
            }
            
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Movie>(collectionView: collectionView, cellProvider: { collectionView, indexPath, movie -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
            cell.set(movie: movie)
            return cell
        })
    }
    
    func updateData(on movies: [Movie]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }

}

extension MovieListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreMovies else { return }
            page += 1
            getPopularMovies(page: page)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let activeArray     = isSearching ? filteredMovies : movies
//        let movie           = activeArray[indexPath.item]
//
//        let destVC          = MovieInfoVC()
//        destVC.movie        = movie
//        let navController   = UINavigationController(rootViewController: destVC)
//        present(navController, animated: true)
//    }
}

extension MovieListVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        
        isSearching = true
        
        filteredMovies = movies.filter { $0.title.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredMovies)
        
    }
    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        isSearching = false
//        updateData(on: movies)
//    }
}
