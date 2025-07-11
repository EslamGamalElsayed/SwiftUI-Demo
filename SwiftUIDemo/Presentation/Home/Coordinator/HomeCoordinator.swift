//
//  HomeCoordinator.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation
import SwiftUI

class HomeCoordinator: Coordinator {
    func navigateToLeaguesScreen(sportName: String) {
        navigate(to: .LEAGUES(sportName: sportName))
    }
}
