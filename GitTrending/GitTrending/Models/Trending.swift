//
//  Trending.swift
//  GitTrending
//
//  Created by Bala Vino on 13/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation

enum TrendingType {
    case repository
    case developer
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
