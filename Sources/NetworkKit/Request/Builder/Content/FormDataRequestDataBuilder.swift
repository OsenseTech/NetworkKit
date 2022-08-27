//
//  FormDataRequestDataBuilder.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2022/1/15.
//

import Foundation

struct FormDataRequestDataBuilder: RequestBuilder {
    
    let param: [String: Any]
    
    public func adapted(_ request: URLRequest) throws -> URLRequest {
        var request = request
        let body = NSMutableData()
        
        guard let contentTypeValue = request.value(forHTTPHeaderField: "Content-Type") else { return request }
        let boundary = contentTypeValue.suffix(45)
        
        for (key, value) in param {
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }
        
        body.appendString("--\(boundary)--\r\n")
                
        request.httpBody = body as Data
        
        return request
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
