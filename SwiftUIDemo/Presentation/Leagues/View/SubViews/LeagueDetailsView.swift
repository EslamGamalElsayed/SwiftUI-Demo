//
//  LeagueDetailsView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 20/06/2025.
//

import SwiftUI

struct LeagueDetailsView: View {
    var league: SportLeagues
    var body: some View {
        GroupBox {
            VStack(alignment: .center, spacing: 0) {
                setupImage(imageName: "DHL", width: 25, height: 25)
                    .cornerRadius(15, corners: .allCorners)
                setupText(text: "Egypt", font: .system(size: 17), color: .headerText, weight: .heavy)
                HStack {
                    setupImage(imageName: "DHL", width: 25, height: 25)
                        .cornerRadius(15, corners: .allCorners)
                    setupText(text: "Egypt", font: .system(size: 17), color: .headerText, weight: .heavy)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .backgroundStyle(.highlightedCustomerCellBorder)
        .cornerRadius(15, corners: .allCorners)
    }
    
}

//#Preview {
//    LeagueDetailsView()
//}
