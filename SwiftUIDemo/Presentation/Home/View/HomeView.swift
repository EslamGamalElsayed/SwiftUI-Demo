//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import SwiftUI

struct HomeView<HomeViewModel: HomeViewModelProtocol>: View where HomeViewModel: ObservableObject {
    
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            
            Color.headerText
                .ignoresSafeArea(edges: .all)
            
            ScrollView(.horizontal) {
                
                HStack (spacing: 0){
                    
                    ForEach(viewModel.getAllSports()) { sport in
                        SportView(sport: sport, viewModel: viewModel)
                    }
                }
            }
            .scrollIndicators(.never, axes: .horizontal)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
        }
    }
    
}

#Preview("Interactive Canvas Navigation") {
    CoordinatorPreviewWrapper()
}



