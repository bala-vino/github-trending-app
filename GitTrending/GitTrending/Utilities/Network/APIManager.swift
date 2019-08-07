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

private func getTrending(_ language: String?, _ dateRange: TrendingDataRange = .daily,
                         _ type: TrendingType = .repositories,
                         completionHandler: @escaping (Trending?, Error?) -> ()) {
    let queryParams = getQueryParamsForTrending(language, dateRange)
    var endpoint = Endpoint(path: URLPath.trendingRepo.rawValue, queryItems: queryParams)
    if type == .developers {
        endpoint = Endpoint(path: URLPath.trendingDevelopers.rawValue, queryItems: queryParams)
    }
    var apiRequest = APIRequest(endPoint: endpoint)
    apiRequest.responseType = .string

    request(apiRequest, String.self) { (response, error) in
        if let error = error {
            completionHandler(nil, error)
        }
        else {
            let trendingModel = parseTrendingResponse(response, type: type)
            completionHandler(trendingModel, nil)
        }
    }
}

func getTrendingRepositories(_ language: String?, _ dateRange: TrendingDataRange = .daily,
                             completionHandler: @escaping (Trending?, Error?) -> ()) {
    getTrending(language, dateRange, .repositories, completionHandler: completionHandler)
}

func getTrendingDevelopers(_ language: String?, _ dateRange: TrendingDataRange = .daily,
                           completionHandler: @escaping (Trending?, Error?) -> ()) {
    getTrending(language, dateRange, .developers, completionHandler: completionHandler)
}

