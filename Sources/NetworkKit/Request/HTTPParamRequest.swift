//
//  HTTPParamRequest.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2022/1/23.
//

import Foundation

public protocol HTTPParamRequest: HTTPRequest {
    associatedtype RequestType: Encodable
    var parameters: RequestType { get }
    var encoder: JSONEncoder { get }
}

public extension HTTPParamRequest {
    var requestBuilders: [RequestBuilder] {[
        PathBuilder(baseURL: baseURL, path: path),
        method.builder,
        header.builder,
        RequestContentBuilder(method: method, contentType: contentType, param: parameters, encoder: encoder)
    ]}
    
    var encoder: JSONEncoder {
        JSONEncoder()
    }
}
