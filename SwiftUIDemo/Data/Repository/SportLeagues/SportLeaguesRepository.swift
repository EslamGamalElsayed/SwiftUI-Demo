//
//  HomeRepository.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - SportLeaguesRepositoryProtocol
protocol SportLeaguesRepositoryProtocol {
    func getSportLeagues<T: Codable>(with data: Any?) async throws -> T
}

// MARK: - SportLeaguesRepository
class SportLeaguesRepository: SportLeaguesRepositoryProtocol {
    
    private let networkManager: NetworkManagerProtocol
    private let sportLeaguesConfig: APIEndpointConfig
    
    init(networkManager: NetworkManagerProtocol, sportLeaguesConfig: APIEndpointConfig) {
        self.networkManager = networkManager
        self.sportLeaguesConfig = sportLeaguesConfig
    }
    
    func getSportLeagues<T: Codable>(with data: Any?) async throws -> T {
        try await networkManager.request(request: sportLeaguesConfig.request)
    }
    
}
