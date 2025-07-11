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
    func updateModel(with data: Any?)
}

extension APIEndpointConfig {
    func updateModel(with data: Any?) {}
}

