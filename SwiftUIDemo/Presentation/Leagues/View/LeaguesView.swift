//
//  LeaguesView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import SwiftUI


struct LeaguesView<LeaguesViewModel: LeaguesViewModelProtocol>: View where LeaguesViewModel: ObservableObject {
    
    @StateObject var viewModel: LeaguesViewModel
    
    var body: some View {
        Text(viewModel.getSportName())
    }
}

#Preview("Interactive Canvas Navigation") {
    CoordinatorPreviewWrapper()
}
