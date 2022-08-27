//
//  PathBuilder.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2022/2/8.
//

import Foundation

struct PathBuilder: RequestBuilder {
    
    let baseURL: URL?
    let path: String
    
    func adapted(_ request: URLRequest) throws -> URLRequest {
        guard let url = baseURL else { throw RequestError.baseURLInvalid }
        
        let fullURL = url.appendingPathComponent(path)
        let request = URLRequest(url: fullURL)
        
        return request
    }
}
