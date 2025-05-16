//
//  HomeRequestConfig.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - APIEndpointConfig Protocol
protocol APIEndpointConfig {
    var request: APIRequest { get }
}

class HomeRequestConfig: APIEndpointConfig {

    
    var request: APIRequest {
        return APIRequestBuilder(url: URL(string: EndPointsURLs.baseUrl + EndPointsURLs.homeReuqest), method: .POST)
            .setParameters(["username" :  "",
                            "password" :  ""],
                           encoding: .json)
            .build()
    }
    
}
