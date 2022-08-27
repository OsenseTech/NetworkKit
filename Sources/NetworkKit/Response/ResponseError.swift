//
//  ResponseError.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/21.
//

import Foundation

public enum ResponseError: Error {
    case nilData
    case nonHTTPResponse
    case apiError(error: APIError, statusCode: Int)
    case error(code: String, statusCode: Int)
    case customError(customError: Decodable, statusCode: Int)
    case serverError(statusCode: Int)
}

public struct APIError: Decodable {
    public let code: String
    public let message: String
}
