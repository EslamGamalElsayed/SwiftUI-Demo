//
//  HomeRepository.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - HomeRepository Protocol
protocol HomeRepositoryProtocol {
    func getNowPlayingMovies<T: Codable>(with data: Any?) async throws -> T
}

// MARK: - LoginRepository
class HomeRepository: HomeRepositoryProtocol {
    
    private let networkManager: NetworkManagerProtocol
    private let homeRequestConfig: HomeRequestConfig
    
    init(networkManager: NetworkManagerProtocol, homeRequestConfig: HomeRequestConfig) {
        self.networkManager = networkManager
        self.homeRequestConfig = homeRequestConfig
    }
    
    func getNowPlayingMovies<T: Codable>(with data: Any?) async throws -> T {
        try await networkManager.request(request: homeRequestConfig.nowPlayingMoviesConfig.request)
    }
    
}
