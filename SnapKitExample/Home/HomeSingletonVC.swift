//
//  HomeSingletonVC.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
class HomeSingletonVC: NSObject {
    static let shared = HomeSingletonVC()
    var movies : MovieModel?
    func getMovies(){
        Network.shared.fetchSearchMovies() {  [weak self] (movies) in
            self?.movies = movies
            print(movies)
            NotificationCenter.default.post(name: Notification.Name("refreshTableView"), object: nil)

        }
    }
}
