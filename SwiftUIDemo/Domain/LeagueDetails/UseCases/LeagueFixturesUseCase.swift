//
//  LeagueFixturesUseCase.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import Foundation

protocol LeagueFixturesUseCaseProtocol {
    func executeLeagueFixtures<T: Codable>(with data: Any?) async throws -> T
}

class LeagueFixturesUseCase: LeagueFixturesUseCaseProtocol {
    
    private let leagueFixturesRepository: LeagueFixturesRepositoryProtocol
    
    init(leagueFixturesRepository: LeagueFixturesRepositoryProtocol) {
        self.leagueFixturesRepository = leagueFixturesRepository
    }
    
    func executeLeagueFixtures<T: Codable>(with data: Any?) async throws -> T {
        try await leagueFixturesRepository.getLeagueFixtures(with: data)
    }
}
