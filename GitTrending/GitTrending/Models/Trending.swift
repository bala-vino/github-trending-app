//
//  Trending.swift
//  GitTrending
//
//  Created by Bala Vino on 13/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation

enum TrendingType: String {
    case repositories = "Repositories"
    case developers = "Developers"
}

struct PopularRepo {
    let title: String
    let description: String
    let path: String
}

struct Trending {
    let languages: [Language]
    var repositories: [TrendingRepository]? = nil
    var developers: [TrendingDevelopers]? = nil
}
