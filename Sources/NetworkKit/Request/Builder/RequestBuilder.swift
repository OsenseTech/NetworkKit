//
//  RequestBuilder.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

public protocol RequestBuilder {
    func adapted(_ request: URLRequest) throws -> URLRequest
}

struct AnyBuilder: RequestBuilder {
    let block: (URLRequest) throws -> URLRequest
    
    func adapted(_ request: URLRequest) throws -> URLRequest {
        return try block(request)
    }
}

extension HTTPRequest {
    func buildRequest() throws -> URLRequest {
        guard let url = baseURL else { throw RequestError.baseURLInvalid }
        
        let request = URLRequest(url: url)
        return try requestBuilders.reduce(request) { try $1.adapted($0) }
    }
}
