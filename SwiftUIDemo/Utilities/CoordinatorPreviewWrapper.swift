//
//  CoordinatorPreviewWrapper.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation
import SwiftUI

struct CoordinatorPreviewWrapper: View {
    @State private var path = NavigationPath()
    
    private var pathBinding: Binding<NavigationPath> {
          Binding(
              get: { self.path },
              set: { self.path = $0 }
          )
      }
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeView(viewModel: HomeDIContainer.shared.getHomeViewModel(with: pathBinding))
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .HOME:
                    HomeView(viewModel: HomeDIContainer.shared.getHomeViewModel(with: pathBinding))
                case .LEAGUES(let sportName):
                    leaguesView(sportName: sportName)
                }
            }
        }
    }
}

extension CoordinatorPreviewWrapper {
    private func leaguesView(sportName: String) -> some View {
        let viewModel = LeaguesDIContainer.shared.getLeaguesViewModel(with: pathBinding)
        viewModel.setupSportName(sportName)
        return LeaguesView(viewModel: viewModel)
   }
}

#Preview("Interactive Canvas Navigation") {
    CoordinatorPreviewWrapper()
}
