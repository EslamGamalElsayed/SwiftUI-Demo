//
//  LeaguesViewModel.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - typealias
typealias LeaguesViewModelProtocol = LeaguesViewModelInput & LeaguesViewModelOutput

// MARK: - LeaguesViewModel

class LeaguesViewModel: ObservableObject, LeaguesViewModelProtocol {
    
    // MARK: - Variables
    private let coordiantor: LeaguesCoordinator
    private let leaguesUseCase: SportLeaguesUseCaseProtocol
    private var sportName: String?
    
    // MARK: - Initiliazer
    init(coordiantor: LeaguesCoordinator, leaguesUseCase: SportLeaguesUseCaseProtocol) {
        self.coordiantor = coordiantor
        self.leaguesUseCase = leaguesUseCase
        print("ESLAM")
    }
    
    func setupSportName(_ sportName: String) {
        self.sportName = sportName
    }
    
    
}

// MARK: - LeaguesViewModel Input

extension LeaguesViewModel {
    func getSportName() -> String {
        sportName ?? "DEFAULT VALUE"
    }
}
