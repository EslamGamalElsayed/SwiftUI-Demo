//
//  HomeRequestUseCase.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

protocol HomeUseCasesProtocol {
    func executeGetNowPlayingMovies<T: Codable>(with data: Any?) async throws -> T
}

class HomeUseCase: HomeUseCasesProtocol {
    
    private let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    func executeGetNowPlayingMovies<T: Codable>(with data: Any?) async throws -> T {
        try await homeRepository.getNowPlayingMovies(with: data)
    }
    
}
