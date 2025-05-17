//
//  NowPlayingMoviesConfig.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - APIEndpointConfig Protocol
protocol APIEndpointConfig {
    var request: APIRequest { get }
}

class HomeRequestConfig {
    let nowPlayingMoviesConfig: NowPlayingMoviesConfig
    
    init(nowPlayingMoviesConfig: NowPlayingMoviesConfig) {
        self.nowPlayingMoviesConfig = nowPlayingMoviesConfig
    }
}
