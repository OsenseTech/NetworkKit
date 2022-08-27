//
//  HTTPMethodBuilder.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

extension HTTPMethod {
    var builder: AnyBuilder {
        AnyBuilder { req in
            var req = req
            req.httpMethod = self.rawValue
            
            return req
        }
    }
}
