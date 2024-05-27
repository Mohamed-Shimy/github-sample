//
//  RequestTargetType.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol RequestTargetType {
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var sampleDataJSONFile: String? { get }
}

extension RequestTargetType {
 
    var parameters: [String: Any]? { nil }
    var sampleDataJSONFile: String? { nil }
}
