//
//  SportView.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 20/06/2025.
//

import SwiftUI

struct SportView<HomeViewModel: HomeViewModelProtocol>: View where HomeViewModel: ObservableObject {
    
    var sport: Sport
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
        GroupBox {
            VStack {
                setupImage(imageName: sport.imageName, width: 300, height: 300)
                    .cornerRadius(15, corners: .allCorners)
                    .padding()
                Text("\(sport.name)")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundStyle(.headerText)
            }
        }
        .backgroundStyle(.highlightedCustomerCellBorder)
        .cornerRadius(15, corners: .allCorners)
        .shadow(color: .black.opacity(0.7) ,radius: 5)
        .containerRelativeFrame(.horizontal, alignment: .center)
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
    SportView(sport: Sport(name: "Football", imageName: "Football"), viewModel: HomeDIContainer.shared.getHomeViewModel(with: pathBinding))
}
