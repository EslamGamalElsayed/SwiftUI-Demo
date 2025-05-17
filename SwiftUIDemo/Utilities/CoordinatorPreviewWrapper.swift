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
                case .DETAILS(let id):
                    DetailsView(viewModel: DetailsViewModel(navigate: { path.removeLast() }, id: id))
                case .SETTINGS:
                    Text("Settings View")
                }
            }
        }
    }
}

#Preview("Interactive Canvas Navigation") {
    CoordinatorPreviewWrapper()
}
