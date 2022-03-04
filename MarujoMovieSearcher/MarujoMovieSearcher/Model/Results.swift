//
//  Results.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 01/03/22.
//

import Foundation

struct Results: Codable {
    let page: Int
    let results: [Movie]
}

struct Movie: Codable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    var posterPath: String?
}
