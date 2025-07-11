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
        let count = horizontalSizeClass == .regular ? 3 : 1
        return Array(repeating: GridItem(.flexible(), spacing: 16, alignment: .top), count: count)
    }
    
    var body: some View {
        
        ZStack {
            
            Color.headerText
                .ignoresSafeArea(edges: .all)
            
            loadingView
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.getLeagues()) { league in
                        LeagueDetailsView(league: league, viewModel: viewModel)
                    }
                }
                .padding()
            }
            .navigationTitle(viewModel.getSportName())
            .onAppear {
                viewModel.onAppear()
            }
        }
        .showErrorAlert(isPresented: $viewModel.showErrorAlert, errorMessage: viewModel.apiRequestError)
    }
    
    @ViewBuilder
    var loadingView: some View {
        if viewModel.isLoading() {
            ProgressView()
                .scaleEffect(3)
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
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
