//
//  Constant.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
class Constant {
    static let shared = Constant()
    
    let baseURL = "https://api.themoviedb.org/3/movie/"
    let apiKey = "?api_key=e119a390f6cf68b2a33a0bc02c9d46f3"
    let popular = "popular"
    let imageUrl = "https://image.tmdb.org/t/p/w500"
}

