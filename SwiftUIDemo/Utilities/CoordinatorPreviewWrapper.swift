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
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeView(viewModel: HomeViewModel(navigate: { route in
                path.append(route)
            }))
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .HOME:
                    HomeView(viewModel: HomeViewModel(navigate: { path.append($0) }))
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
