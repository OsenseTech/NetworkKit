//
//  JSONRequestDataBuilder.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

struct JSONRequestDataBuilder: RequestBuilder {
    let param: [String: Any]
    
    func adapted(_ request: URLRequest) throws -> URLRequest {
        var request = request
        request.httpBody = try JSONSerialization.data(withJSONObject: param, options: [])
        
        return request
    }
}
