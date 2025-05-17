//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    
    @StateObject private var coordinator = AppFlowCoordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.buildRootView()
        }
    }
}
