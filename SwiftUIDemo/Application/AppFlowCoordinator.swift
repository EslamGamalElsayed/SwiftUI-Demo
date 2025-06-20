//
//  AppFlowCoordinator.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation
import SwiftUI

 class AppFlowCoordinator: ObservableObject {
    
     @Published var path = NavigationPath()
    
    private var pathBinding: Binding<NavigationPath> {
          Binding(
              get: { self.path },
              set: { self.path = $0 }
          )
      }
     
     private lazy var homeViewModel: HomeViewModel = {
           HomeDIContainer.shared.getHomeViewModel(with: pathBinding)
       }()
     
     private lazy var leaguesViewModel: LeaguesViewModel = {
         LeaguesDIContainer.shared.getLeaguesViewModel(with: pathBinding)
       }()
    
    func buildRootView() -> some View {
        NavigationStack(path: pathBinding) {
            self.homeView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .HOME:
                        self.homeView()
                    case .LEAGUES(let sportName):
                        self.leaguesView(sportName: sportName)
                    }
                }
        }
    }

    private func homeView() -> some View {
        return HomeView(viewModel: self.homeViewModel)
    }
     
     private func leaguesView(sportName: String) -> some View {
         self.leaguesViewModel.setupSportName(sportName)
         return LeaguesView(viewModel: self.leaguesViewModel)
    }

    func navigate(to route: AppRoute) {
        path.append(route)
    }

    func goBack() {
        path.removeLast()
    }
}
