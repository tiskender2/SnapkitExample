//
//  MovieModel.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
// MARK: - Movie
struct MovieModel: Codable {
    var page, totalResults, totalPages: Int?
    var results: [Result]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var posterPath: String?
    var id: Int?
    var adult: Bool?
    var backdropPath: String?
    var originalLanguage: OriginalLanguage?
    var originalTitle: String?
    var genreIDS: [Int]?
    var title: String?
    var voteAverage: Double?
    var overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ko = "ko"
}
