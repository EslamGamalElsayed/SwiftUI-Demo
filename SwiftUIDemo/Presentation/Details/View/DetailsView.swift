//
//  DetailsView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import SwiftUI

struct DetailsView: View {
    
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        VStack {
            Text("Passed Value is \(viewModel.id)")
            Button("Go to Home") {
                viewModel.goToHome()
            }
        }
    }
}

#Preview {
    DetailsView(viewModel: DetailsViewModel(id: 50))
}

