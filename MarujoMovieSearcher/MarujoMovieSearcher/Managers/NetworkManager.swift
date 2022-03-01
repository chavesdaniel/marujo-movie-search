//
//  NetworkManager.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 01/03/22.
//

import Foundation

class NetworkManager {
    static let shared   = NetworkManager()
    let baseUrl         = "https://api.themoviedb.org/3/movie/popular?"
    let apiKey          = "172b07b1d15e15c822af3a984089e61f"
    let language        = "pt-BR"
    
    private init() {}
    
    func getPopularMovies(page: Int, completed: @escaping (Result<[Movie], MSError>) -> Void ) {
        let endpoint = baseUrl + "api_key=\(apiKey)&language=\(language)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(Results.self, from: data)
                completed(.success(results.results))
            } catch {
                completed(.failure(.unableToConvert))
            }

        }
        
        task.resume()
    }
}
