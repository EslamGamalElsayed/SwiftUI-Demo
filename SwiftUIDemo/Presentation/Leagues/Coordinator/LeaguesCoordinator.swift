//
//  LeaguesCoordinator.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 20/06/2025.
//

import Foundation
import SwiftUI

class LeaguesCoordinator: Coordinator {
    func navigateToLeagueDetailsScreen(league: League) {
        navigate(to: .LEAGUE_DETAILS(league: league))
    }
}
