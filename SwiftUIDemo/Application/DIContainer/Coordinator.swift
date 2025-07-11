//
//  Coordinator.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import Foundation
import SwiftUI

class Coordinator {
    private var pathBinding: Binding<NavigationPath>
    
    init(pathBinding: Binding<NavigationPath>) {
        self.pathBinding = pathBinding
    }
    
    func navigate(to route: AppRoute) {
        pathBinding.wrappedValue.append(route)
    }
}
