//
//  ContentType.swift
//  NetworkKit
//
//  Created by 蘇健豪 on 2021/12/20.
//

import Foundation

public enum ContentType: String {
    case json = "application/json"
    case url = "application/x-www-form-urlencoded; charset=utf-8"
    case formData = "multipart/form-data"
}
