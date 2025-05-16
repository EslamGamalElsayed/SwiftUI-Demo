//
//  ApiRequestBuilder.swift
//  Shipper
//
//  Created by Eslam Gamal on 28/10/2024.
//

import Foundation

class APIRequestBuilder {
    private var url: URL?
    private var method: HTTPMethod
    private var headers: [String: String]?
    private var parameters: [String: Any]?
    private var parameterEncoding: ParameterEncoding

    init(url: URL?, method: HTTPMethod) {
        self.url = url
        self.method = method
        self.parameterEncoding = .url // Default encoding
        setDefaultHeaders()
    }
    
    private func setDefaultHeaders() {
        self.headers = [:]
        headers?[RequestHeader.NAME.rawValue] = RequestHeaderValues.NAME
        headers?[RequestHeader.TYPE.rawValue] = RequestHeaderValues.TYPE
        headers?[RequestHeader.VERSION.rawValue] = RequestHeaderValues.VERSION
        //headers?[RequestHeader.AUTHORIZATION.rawValue] = RequestHeader.BEARER.rawValue + token
    }

    func setHeaders(_ headers: [String: String]) -> Self {
        for (key, value) in headers {
            self.headers?[key] = value
          }
        return self
    }

    func setParameters(_ parameters: [String: Any], encoding: ParameterEncoding) -> Self {
        self.parameters = parameters
        self.parameterEncoding = encoding
        return self
    }
    
    func setParameterEncoding(_ encoding: ParameterEncoding) -> Self {
        self.parameterEncoding = encoding
        return self
    }

    func build() -> APIRequest {
        return APIRequest(
            url: url,
            method: method,
            headers: headers,
            parameters: parameters,
            parameterEncoding: parameterEncoding
        )
    }
}

enum RequestHeader: String {
    case NAME    = "X-Client-Name"
    case VERSION = "X-Client-Version"
    case TYPE    = "X-Client-Type"
    case AUTHORIZATION  = "Authorization"
    case BEARER = "Bearer "
    case HARMONIZED_CODE_API = "x-api-key"
}


struct RequestHeaderValues {
    static let NAME    = "shipper"
    static let TYPE    = "ios"
    static let VERSION = "v\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")"
}
