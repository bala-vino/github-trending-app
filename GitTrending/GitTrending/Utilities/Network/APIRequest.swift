//
//  APIRequest.swift
//  GitTrending
//
//  Created by Bala Vino on 12/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation
import Alamofire

struct Endpoint {
    let path: String
    let queryItems: [String: String]
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = URLConstants.urlScheme
        components.host = URLConstants.urlHost
        components.path = path
        components.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url
    }
}

enum ResponseType {
    case json
    case string
    case data
}

struct APIRequest {
    let endPoint: Endpoint
    var method: HTTPMethod = .get
    var parameters: Parameters? = nil
    var encoding: ParameterEncoding = URLEncoding.default
    var headers: HTTPHeaders? = nil
    var responseType: ResponseType = .json
}
