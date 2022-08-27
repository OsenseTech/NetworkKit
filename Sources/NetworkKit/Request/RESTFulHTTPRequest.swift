//
//  RESTFulHTTPRequest.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2022/1/18.
//

import Foundation

public protocol RESTFulHTTPRequest: HTTPParamRequest {
    var resource: String { get }
    var resourceId: String { get }
}

public extension RESTFulHTTPRequest {
    var requestBuilders: [RequestBuilder] {[
        PathBuilder(baseURL: baseURL, path: path),
        method.builder,
        header.builder,
        RESTFulRequestBuilder(method: method, resource: resource, resourceId: resourceId),
        RequestContentBuilder(method: method, contentType: contentType, param: parameters, encoder: encoder)
    ]}
    
    var path: String {
        ""
    }
}
