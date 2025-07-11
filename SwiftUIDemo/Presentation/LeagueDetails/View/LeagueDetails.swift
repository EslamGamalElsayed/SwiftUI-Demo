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
        leagueFixturesView
        .onAppear{
            viewModel.onAppear()
        }
    }
    
    var leagueFixturesView: some View {
        ZStack {
            
            loadingView
            
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(viewModel.getFixtures()) { fixture in
                        FixtureView(fixture: fixture)
                    }
                }
            }
            .padding(.horizontal, 20)
            .scrollIndicators(.hidden)
        }
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

#Preview {
    var path = NavigationPath()
     var pathBinding: Binding<NavigationPath> {
          Binding(
              get: { path },
              set: { path = $0}
          )
      }
    LeagueDetails(viewModel: LeagueDetailsDIContainer.shared.getLeagueDetailsViewModel(with: pathBinding))
}


//let fixtures = [Fixtures(matchDate: "2021-07-01T12:00:00Z", homeTeam: "Aresenal", homeTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", awayTeam: "Real Madriddd", awayTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", matchResult: "6 : 4", leagueName: "Primer League", matchRound: "Round 38"), Fixtures(matchDate: "2021-07-01T12:00:00Z", homeTeam: "Aresenal", homeTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", awayTeam: "Real Madrid", awayTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", matchResult: "6 : 4", leagueName: "Primer League", matchRound: "Round 38"), Fixtures(matchDate: "2021-07-01T12:00:00Z", homeTeam: "Aresenal", homeTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", awayTeam: "Real Madrid", awayTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", matchResult: "6 : 4", leagueName: "Primer League", matchRound: "Round 38"), Fixtures(matchDate: "2021-07-01T12:00:00Z", homeTeam: "Aresenal", homeTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", awayTeam: "Real Madrid", awayTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", matchResult: "6 : 4", leagueName: "Primer League", matchRound: "Round 38"), Fixtures(matchDate: "2021-07-01T12:00:00Z", homeTeam: "Aresenal", homeTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", awayTeam: "Real Madrid", awayTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", matchResult: "6 : 4", leagueName: "Primer League", matchRound: "Round 38"), Fixtures(matchDate: "2021-07-01T12:00:00Z", homeTeam: "Aresenal", homeTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", awayTeam: "Real Madrid", awayTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", matchResult: "6 : 4", leagueName: "Primer League", matchRound: "Round 38")]
