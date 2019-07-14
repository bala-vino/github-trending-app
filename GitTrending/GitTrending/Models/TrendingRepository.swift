//
//  TrendingRepository.swift
//  GitTrending
//
//  Created by Bala Vino on 13/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation

struct TrendingRepository {
    let repo: PopularRepo
    let language: String
    let languageColor: String
    let stars: TrendingRepoStarDetails
    let fork: TrendingRepoForkDetails
    let builtBy: [TrendingRepoMember]
}

struct TrendingRepoStarDetails {
    let totalStars: String
    let todayStar: String
    let stargazersPath: String
}

struct TrendingRepoForkDetails {
    let totalFork: String
    let membersPath: String
}

struct TrendingRepoMember {
    let profilePath: String
    let profileImagePath: String
    let hovercardUrlPath: String
}
