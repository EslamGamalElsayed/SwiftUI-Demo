//
//  ApiRequest.swift
//  Shipper
//
//  Created by Eslam Gamal on 28/10/2024.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum ParameterEncoding {
    case url
    case json
}

struct APIRequest {
    let url: URL?
    let method: HTTPMethod
    var headers: [String: String]?
    let parameters: [String: Any]?
    let parameterEncoding: ParameterEncoding
    
}
