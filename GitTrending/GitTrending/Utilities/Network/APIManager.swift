//
//  APIManager.swift
//  GitTrending
//
//  Created by Bala Vino on 11/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation

private func getQueryParamsForTrending(_ language: String?, _ dateRange: TrendingDataRange) -> [String:String]{
    var queryParams: [String: String] = [URLQueryParams.dateRange.rawValue: dateRange.rawValue]
    if let language = language {
        queryParams[URLQueryParams.language.rawValue] = language
    }
    return queryParams
}

func getTrendingRepositories(_ language: String?, _ dateRange: TrendingDataRange = .daily) {
    let queryParams = getQueryParamsForTrending(language, dateRange)
    let endpoint = Endpoint(path: URLPath.trendingRepo.rawValue, queryItems: queryParams)
    var apiRequest = APIRequest(endPoint: endpoint)
    apiRequest.responseType = .string
}

func getTrendingDevelopers(_ language: String?, _ dateRange: TrendingDataRange = .daily) {
    let queryParams = getQueryParamsForTrending(language, dateRange)
    let endpoint = Endpoint(path: URLPath.trendingDevelopers.rawValue, queryItems: queryParams)
    var apiRequest = APIRequest(endPoint: endpoint)
    apiRequest.responseType = .string
}

