//
//  LeaguesView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import SwiftUI


struct LeaguesView<LeaguesViewModel: LeaguesViewModelProtocol>: View where LeaguesViewModel: ObservableObject {
    
    @StateObject var viewModel: LeaguesViewModel
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var columns: [GridItem] {
           let count = horizontalSizeClass == .regular ? 2 : 1
           return Array(repeating: GridItem(.flexible(), spacing: 16), count: count)
       }
    
    var body: some View {
          ScrollView {
              LazyVGrid(columns: columns, spacing: 16) {
                  ForEach(viewModel.getLeagues()) { league in
                      LeagueDetailsView(league: league)
                  }
              }
              .padding()
          }
          .navigationTitle(viewModel.getSportName())
          .onAppear {
              viewModel.onAppear()
          }
      }
}

#Preview("Interactive Canvas Navigation") {
    CoordinatorPreviewWrapper()
}

enum LoadingStatus {
    case START
    case STOP
}
