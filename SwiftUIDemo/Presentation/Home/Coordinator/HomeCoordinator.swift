//
//  HomeCoordinator.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation
import SwiftUI

class HomeCoordinator {
    
    private var pathBinding: Binding<NavigationPath>
    
    init(pathBinding: Binding<NavigationPath>) {
        self.pathBinding = pathBinding
    }
    
    func navigate(to route: AppRoute) {
        pathBinding.wrappedValue.append(route)
    }
    
    func navigateToDetailsScreen() {
        navigate(to: .DETAILS(id: 500))
    }
}
