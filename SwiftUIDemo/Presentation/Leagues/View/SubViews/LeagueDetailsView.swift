//
//  LeagueDetailsView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 20/06/2025.
//

import SwiftUI

struct LeagueDetailsView<LeaguesViewModel: LeaguesViewModelProtocol>: View where LeaguesViewModel: ObservableObject {
    var league: SportLeagues
    @ObservedObject var viewModel: LeaguesViewModel
    
    var body: some View {
        GroupBox {
            VStack(alignment: .center, spacing: 0) {
                setupAsyncImage(urlString: league.countryImageUrl ?? "", width: 30, height: 30)
                    .clipShape(Circle())
                setupText(text: league.countryName ?? "", font: .system(size: 17), color: .headerText, weight: .heavy)
                    .padding(.bottom, 15)
                HStack {
                    setupAsyncImage(urlString: league.leagueImageUrl ?? "", width: 30, height: 30)
                        .clipShape(Circle())
                    setupText(text: league.leagueName ?? "", font: .system(size: 17), color: .headerText, weight: .heavy)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .backgroundStyle(.highlightedCustomerCellBorder)
        .cornerRadius(15, corners: .allCorners)
        .onTapGesture {
            viewModel.didTapLeague(league: league)
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
    LeagueDetailsView(league: SportLeagues(leagueId: 0, leagueName: "Primer League", countryId: 0, countryName: "Engeland", leagueImageUrl: "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png", countryImageUrl: "https://apiv2.allsportsapi.com/logo/logo_country/5_italy.png"), viewModel: LeaguesDIContainer.shared.getLeaguesViewModel(with: pathBinding))
}
