//
//  URLQueryDataBuilder.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

struct URLQueryDataBuilder: RequestBuilder {
    let data: [String: Any]
    
    func adapted(_ request: URLRequest) throws -> URLRequest {
        var request = request
        guard let url = request.url else {
            throw RequestError.noURL
        }
        
        var urlString = url.absoluteString
        urlString.append("?")
        
        var parms = data.compactMap { "\($0.key)=\($0.value)" }.joined(separator: "&")
        parms = parms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        urlString.append(contentsOf: parms)
        request.url = URL(string: urlString)
        
        return request
    }
}
