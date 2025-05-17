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
        headers?[RequestHeader.ACCEPT.rawValue] = RequestHeaderValues.ACCEPT
        headers?[RequestHeader.AUTHORIZATION.rawValue] = RequestHeader.BEARER.rawValue + "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMDc0NWI2OTY3OTkxNTVjOWFmOGVmZmY2MmQxNDA1OSIsIm5iZiI6MTc0NzQ5MTM3My4zMjE5OTk4LCJzdWIiOiI2ODI4OWEyZDk4OWNmNjVjN2VkYjIxNDkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.UNj0NEUZ3vaJ3hEfUs3Nmz9JE9dpF-XY93EqK8jpJsk"
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
    case AUTHORIZATION  = "Authorization"
    case BEARER = "Bearer "
    case ACCEPT = "accept"
}


struct RequestHeaderValues {
    static let ACCEPT  = "application/json"
    static let VERSION = "v\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")"
}
