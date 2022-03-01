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
    var id: Int
    var title: String
    var overview: String
    var posterPath: String?
}
