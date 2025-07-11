//
//  LeagueDetailsViewModel.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import Foundation

// MARK: - typealias
typealias LeagueDetailsViewModelProtocol = LeagueDetailsViewModelInput & LeagueDetailsViewModelOutput & BaseViewModelProtocol

// MARK: - LeagueDetailsViewModel

class LeagueDetailsViewModel: ObservableObject, LeagueDetailsViewModelProtocol {
  
    // MARK: - Variables
    private let coordiantor: LeagueDetailsCoordinator
    private let leagueFixturesUseCase: LeagueFixturesUseCaseProtocol
    private var league: League?
    
    var apiRequestError: String = ""
    @Published var loadingStatus: LoadingStatus = .START
    @Published var showErrorAlert: Bool = false
    

    // MARK: - Initiliazer
    init(coordiantor: LeagueDetailsCoordinator, leagueFixturesUseCase: LeagueFixturesUseCaseProtocol) {
        self.coordiantor = coordiantor
        self.leagueFixturesUseCase = leagueFixturesUseCase
    }
    
    func setupLeague(_ league: League) {
        self.league = league
    }
}

extension LeagueDetailsViewModel {
    
    @MainActor func onAppear() {}
    
    func onDisappear() {}
}
