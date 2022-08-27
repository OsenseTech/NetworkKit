//
//  BadResponseHandler.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

public struct BadResponseHandler: ResponseHandler {
    
    public init() { }
    
    public func shouldApply<Req: HTTPRequest>(request: Req, data: Data, response: HTTPURLResponse) -> Bool {
        !(200...299).contains(response.statusCode)
    }
    
    public func apply<Req>(request: Req, data: Data, response: HTTPURLResponse) async -> ResponseAction<Req> where Req : HTTPRequest {
        do {
            printJSON(data: data)
            let decoder = JSONDecoder()
            let value = try decoder.decode(APIError.self, from: data)
            return .error(ResponseError.apiError(error: value, statusCode: response.statusCode))
        } catch {
            return .error(error)
        }
    }
    
}
