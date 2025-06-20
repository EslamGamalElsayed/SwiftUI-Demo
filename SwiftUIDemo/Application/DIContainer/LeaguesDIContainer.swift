//
//  LeaguesDIContainer.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 20/06/2025.
//

import Foundation
import SwiftUI

class LeaguesDIContainer {
    static let shared = LeaguesDIContainer()
    private init() {}
    
    func getLeaguesViewModel(with pathBinding: Binding<NavigationPath>) -> LeaguesViewModel{
        LeaguesViewModel(coordiantor: getLeaguesCoordinator(with: pathBinding), leaguesUseCase: getLeaguesUseCase())
    }
    
    private func getLeaguesCoordinator(with pathBinding: Binding<NavigationPath>) -> LeaguesCoordinator {
        LeaguesCoordinator(pathBinding: pathBinding)
    }
    
    private func getLeaguesUseCase() -> SportLeaguesUseCaseProtocol {
        SportLeaguesUseCase(sportLeaguesRepository: getLeaguesRepository())
    }
    
    private func getLeaguesRepository() -> SportLeaguesRepositoryProtocol {
        SportLeaguesRepository(networkManager: NetworkManager(), sportLeaguesConfig: SportLeaguesConfig())
    }

}
