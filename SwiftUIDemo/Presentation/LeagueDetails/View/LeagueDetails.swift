//
//  LeagueDetails.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import SwiftUI

struct LeagueDetails<LeagueDetailsViewModel: LeagueDetailsViewModelProtocol>: View where LeagueDetailsViewModel: ObservableObject  {
    
    @StateObject var viewModel: LeagueDetailsViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


