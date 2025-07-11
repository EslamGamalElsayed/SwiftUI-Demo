//
//  FixtureView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import SwiftUI

struct FixtureView: View {
    
    var fixture: Fixtures
    
    var body: some View {
        
        GroupBox {
            
            VStack(alignment: .center, spacing: 0) {
                
                setupText(text:  fixture.leagueName, font: .system(size: 23), color: .headerText, weight: .heavy)
                
                setupText(text:  fixture.matchRound ?? "", font: .system(size: 16), color: .headerText, weight: .heavy)
                
                setupText(text:  fixture.matchDate ?? "", font: .system(size: 16), color: .headerText, weight: .heavy)
                    .padding(.bottom, 15)
                
                HStack (alignment: .top){
                    
                    getTeamView(imageUrl: fixture.homeTeamImage ?? "", name: fixture.homeTeam ?? "")
                       
                    
                    setupText(text:  fixture.matchResult ?? "", font: .system(size: 30), color: .headerText, weight: .heavy)
                        .padding([.top,.horizontal], 20)
                    
                    getTeamView(imageUrl: fixture.awayTeamImage ?? "", name: fixture.awayTeam ?? "")
                        
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .backgroundStyle(.highlightedCustomerCellBorder)
        .cornerRadius(15, corners: .allCorners)
    }
    
    private func getTeamView(imageUrl: String, name: String) -> some View {
        VStack {
            setupAsyncImage(urlString: imageUrl, width: 70, height: 70)
                .clipShape(Circle())
            setupText(text:  name, font: .system(size: 20), color: .headerText, weight: .heavy)
                .padding(.bottom, 15)
                .multilineTextAlignment(.center)
        }
        .frame(width: 150)
    }
}


#Preview {
    FixtureView(fixture: Fixtures(matchDate: "2021-07-01T12:00:00Z", homeTeam: "Aresenal", homeTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", awayTeam: "Real Madriddd", awayTeamImage: "https://apiv2.allsportsapi.com/logo/93_lazio.jpg", matchResult: "6 : 4", leagueName: "Primer League", matchRound: "Round 38"))
}
