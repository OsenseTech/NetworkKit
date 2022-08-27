//
//  HTTPHeaders.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/16.
//

import Foundation

public struct HTTPHeader {
    public let headers: [String: String]
    
    public init(_ headers: [String: String] = [:]) {
        self.headers = headers
    }
}
