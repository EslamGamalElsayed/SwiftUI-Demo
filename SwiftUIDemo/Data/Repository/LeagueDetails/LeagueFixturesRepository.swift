//
//  LeagueFixturesRepository.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import Foundation

// MARK: - LeagueFixturesRepositoryProtocol
protocol LeagueFixturesRepositoryProtocol {
    func getLeagueFixtures<T: Codable>(with data: Any?) async throws -> T
}

// MARK: - SportLeaguesRepository
class LeagueFixturesRepository: LeagueFixturesRepositoryProtocol {
    
    private let networkManager: NetworkManagerProtocol
    private let leagueFixturesConfig: APIEndpointConfig
    
    init(networkManager: NetworkManagerProtocol, leagueFixturesConfig: APIEndpointConfig) {
        self.networkManager = networkManager
        self.leagueFixturesConfig = leagueFixturesConfig
    }
    
    func getLeagueFixtures<T: Codable>(with data: Any?) async throws -> T {
        leagueFixturesConfig.updateModel(with: data)
        return try await networkManager.request(request: leagueFixturesConfig.request)
    }
    
}
