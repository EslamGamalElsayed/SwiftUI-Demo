//
//  LeagueDetailsDIContainer.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import Foundation
import SwiftUI

class LeagueDetailsDIContainer {
    static let shared = LeagueDetailsDIContainer()
    private init() {}
    
    func getLeagueDetailsViewModel(with pathBinding: Binding<NavigationPath>) -> LeagueDetailsViewModel{
        LeagueDetailsViewModel(coordiantor: getLeagueDetailsCoordinator(with: pathBinding), leagueFixturesUseCase: getLeagueFixturesUseCase())
    }
    
    private func getLeagueDetailsCoordinator(with pathBinding: Binding<NavigationPath>) -> LeagueDetailsCoordinator {
        LeagueDetailsCoordinator(pathBinding: pathBinding)
    }
    
    private func getLeagueFixturesUseCase() -> LeagueFixturesUseCaseProtocol {
        LeagueFixturesUseCase(leagueFixturesRepository: getLeagueFixturesRepository())
    }
    
    private func getLeagueFixturesRepository() -> LeagueFixturesRepositoryProtocol {
        LeagueFixturesRepository(networkManager: NetworkManager(), leagueFixturesConfig: FixturesConfig())
    }

}
