//
//  ServerErrorResponseHandler.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2022/1/15.
//

import Foundation

struct ServerErrorResponseHandler: ResponseHandler {
    func shouldApply<Req>(request: Req, data: Data, response: HTTPURLResponse) -> Bool where Req : HTTPRequest {
        (500...599).contains(response.statusCode)
    }
    
    func apply<Req>(request: Req, data: Data, response: HTTPURLResponse) async -> ResponseAction<Req> where Req : HTTPRequest {
        do {
            guard JSONSerialization.isValidJSONObject(data) else {
                return .error(ResponseError.serverError(statusCode: response.statusCode))
            }
            
            let decoder = JSONDecoder()
            let value = try decoder.decode(APIError.self, from: data)
            return .error(ResponseError.apiError(error: value, statusCode: response.statusCode))
        } catch {
            return .error(error)
        }
    }
    
}
