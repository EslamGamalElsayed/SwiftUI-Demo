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
        
        ScrollView {
            VStack {
                ForEach(0...100, id: \.self) {_ in
                    Text("TEST")
                }
            }
        }
        Button("Go to Details") {
            viewModel.didTapDetails()
               }
    
    }
}

#Preview("Interactive Canvas Navigation") {
    CoordinatorPreviewWrapper()
}



