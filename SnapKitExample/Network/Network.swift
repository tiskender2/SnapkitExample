//
//  Network.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
class Network {
    static let shared = Network()
    let request = Constant.shared.baseURL + Constant.shared.popular + Constant.shared.apiKey
    func fetchSearchMovies(completionHandler: @escaping (MovieModel) -> Void) {
        
        let url = URL(string: request)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(response)")
                    return
            }
            if let data = data,
                let movies = try? JSONDecoder().decode(MovieModel.self, from: data) {
                completionHandler(movies)
            }
        })
        task.resume()
    }
}
