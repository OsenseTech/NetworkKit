//
//  HTTPHeaderBuilder.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

extension HTTPHeader {
    var builder: AnyBuilder {
        AnyBuilder { req in
            var req = req
            for (key, value) in self.headers {
                req.addValue(value, forHTTPHeaderField: key)
            }
            
            return req
        }
    }
}
