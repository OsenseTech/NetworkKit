//
//  ResponseHandler.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

public protocol ResponseHandler {
    func shouldApply<Req: HTTPRequest>(request: Req, data: Data, response: HTTPURLResponse) -> Bool
    func apply<Req: HTTPRequest>(request: Req, data: Data, response: HTTPURLResponse) async -> ResponseAction<Req>
}

public extension ResponseHandler {
    func printJSON(data: Data) {
        #if DEBUG
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
        guard JSONSerialization.isValidJSONObject(json) else {
            print("Invalid Object")
            return
        }
        
        if let dict = json as? [String: Any] {
            print(dict)
        }
        #endif
    }
}
