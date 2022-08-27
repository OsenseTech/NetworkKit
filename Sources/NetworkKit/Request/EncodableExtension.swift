//
//  EncodableExtension.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2022/1/15.
//

import Foundation

extension Encodable {
    func dictValue(encoder: JSONEncoder) -> [String: Any] {
        do {
            let data = try encoder.encode(self)
            let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] ?? [:]
            return dict
        } catch {
            return [:]
        }
    }
}
