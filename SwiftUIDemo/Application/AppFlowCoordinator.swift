//
//  AppFlowCoordinator.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation
import SwiftUI

final class AppFlowCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()

    static let shared = AppFlowCoordinator()
    
    private init() {
        
    }
    
    private var pathBinding: Binding<NavigationPath> {
          Binding(
              get: { self.path },
              set: { self.path = $0 }
          )
      }
    
    func buildRootView() -> some View {
        NavigationStack(path: pathBinding) {
            self.homeView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .HOME:
                        self.homeView()
                    case .DETAILS(let id):
                        self.detailsView(id: id)
                    case .SETTINGS:
                        self.homeView()
                    }
                }
        }
    }

    private func homeView() -> some View {
        let vm = HomeViewModel(navigate: self.navigate)
        return HomeView(viewModel: vm)
    }

    private func detailsView(id: Int) -> some View {
        let vm = DetailsViewModel(navigate: self.goBack, id: id)
        return DetailsView(viewModel: vm)
    }

    func navigate(to route: AppRoute) {
        path.append(route)
    }

    func goBack() {
        path.removeLast()
    }
}
