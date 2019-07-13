//
//  APIConstants.swift
//  GitTrending
//
//  Created by Bala Vino on 12/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation

struct URLConstants {
    static let urlScheme = "https"
    static let urlHost = "api.github.com"
}

enum URLPath: String {
    case trendingRepo = "trending"
    case trendingDevelopers = "trending/developers"
}

enum URLQueryParams: String {
    case language = "language"
    case dateRange = "since"
}

enum TrendingDataRange: String {
    case daily = "daily"
    case thisWeek = "weekly"
    case thisMonth = "monthly"
}
