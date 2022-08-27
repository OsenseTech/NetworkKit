//
//  HTTPMethod.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/16.
//

import Foundation

public enum HTTPMethod: String {
    
    /// read
    case get = "GET"
    
    /// create
    case post = "POST"
    
    /// update
    case patch = "PATCH"
    
    /// replace (create or update)
    case put = "PUT"
    
    /// delete
    case delete = "DELETE"
}
