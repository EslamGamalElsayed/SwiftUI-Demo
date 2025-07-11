//
//  HomeRequestUseCase.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

protocol SportLeaguesUseCaseProtocol {
    func executeGetSportLeagues<T: Codable>(with data: Any?) async throws -> T
}

class SportLeaguesUseCase: SportLeaguesUseCaseProtocol {
    
    private let sportLeaguesRepository: SportLeaguesRepositoryProtocol
    
    init(sportLeaguesRepository: SportLeaguesRepositoryProtocol) {
        self.sportLeaguesRepository = sportLeaguesRepository
    }
    
    func executeGetSportLeagues<T: Codable>(with data: Any?) async throws -> T {
        try await sportLeaguesRepository.getSportLeagues(with: data)
    }
    
}
