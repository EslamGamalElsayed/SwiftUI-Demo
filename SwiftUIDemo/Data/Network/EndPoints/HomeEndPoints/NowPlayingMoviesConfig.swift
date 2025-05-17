//
//  NowPlayingMoviesConfig.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation

class NowPlayingMoviesConfig: APIEndpointConfig {

    var request: APIRequest {
        return APIRequestBuilder(url: URL(string: EndPointsURLs.baseUrl + EndPointsURLs.nowPlayingMovies), method: .GET)
            .setParameters(["language" :  "en-US",
                            "page" :  "1"],
                           encoding: .url)
            .build()
    }
    
}
