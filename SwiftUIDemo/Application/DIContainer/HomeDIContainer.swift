//
//  HomeDIContainer.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation
import SwiftUI

class HomeDIContainer {
    static let shared = HomeDIContainer()
    private init() {}
    
    func getHomeViewModel(with pathBinding: Binding<NavigationPath>) -> HomeViewModel {
        HomeViewModel(coordiantor: getHomeCoordinator(with: pathBinding))
    }
    
    private func getHomeCoordinator(with pathBinding: Binding<NavigationPath>) -> HomeCoordinator {
        HomeCoordinator(pathBinding: pathBinding)
    }

}
