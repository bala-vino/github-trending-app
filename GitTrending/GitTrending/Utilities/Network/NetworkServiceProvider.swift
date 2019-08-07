//
//  NetworkServiceProvider.swift
//  GitTrending
//
//  Created by Bala Vino on 11/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation
import Alamofire
import Combine

func request<T:Codable>(_ request: APIRequest,
                        _ type: T.Type,
                        completionHandler: @escaping (T?, Error?) -> ()) {
    
    guard let url = request.endPoint.url else {
        return
    }
    
    let dataRequest = Alamofire.request(url,
                                        method: request.method,
                                        parameters: request.parameters,
                                        encoding: request.encoding,
                                        headers: request.headers)
    dataRequest.validate()
    
    switch request.responseType {
    case .json:
        dataRequest.responseJSON { (dataResponse) in
            DispatchQueue.runInMainAsync {
                let responseValue:T?  = JSONDecoder().getObject(type, dataResponse.data!)
                completionHandler(responseValue, dataResponse.error)
            }
        }
        
    case .string:
        dataRequest.responseString{ (dataResponse) in
            DispatchQueue.runInMainAsync {
                var responseValue:T? = nil
                if let data = dataResponse.data {
                    responseValue = String(decoding: data, as: UTF8.self) as? T
                }
                completionHandler(responseValue, dataResponse.error)
            }
        }
        
    case .data:
        //        request.responseData{ (dataResponse) in
        //            DispatchQueue.runInMainAsync {
        //                completionHandler(dataResponse.result.isSuccess, dataResponse.data, dataResponse.error)
        //            }
        //        }
        break
    }
}

enum RequestError: Error {
    case request(code: Int, error: Error?)
    case cannotParse
    case unknown
}

extension URLSession {
    func send(request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap { data, response -> Data in
                let httpResponse = response as? HTTPURLResponse
                if let httpResponse = httpResponse, 200..<300 ~= httpResponse.statusCode {
                    return data
                }
                else if let httpResponse = httpResponse {
                    throw RequestError.request(code: httpResponse.statusCode, error: NSError(domain: httpResponse.description, code: httpResponse.statusCode, userInfo: httpResponse.allHeaderFields as? [String : Any]))
                }     else {
                    throw RequestError.unknown
                }
                
            }
            .eraseToAnyPublisher()
    }
}
