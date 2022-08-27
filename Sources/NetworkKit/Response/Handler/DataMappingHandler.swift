//
//  DataMappingHandler.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

public struct DataMappingHandler: ResponseHandler {
    
    let condition: (Data) -> Bool
    let transform: (Data) -> Data
    
    public init(condition: @escaping ((Data) -> Bool), transform: @escaping (Data) -> Data) {
        self.condition = condition
        self.transform = transform
    }
    
    public func shouldApply<Req: HTTPRequest>(request: Req, data: Data, response: HTTPURLResponse) -> Bool {
        condition(data)
    }
    
    public func apply<Req: HTTPRequest>(request: Req,
                                        data: Data,
                                        response: HTTPURLResponse,
                                        done completion: @escaping (ResponseAction<Req>) -> Void) {
        completion(.continue(transform(data), response))
    }
    
    public func apply<Req>(request: Req, data: Data, response: HTTPURLResponse) async -> ResponseAction<Req> where Req : HTTPRequest {
        .continue(transform(data), response)
    }
}
