//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        Button("Go to Details") {
                   viewModel.goToDetails()
               }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}



