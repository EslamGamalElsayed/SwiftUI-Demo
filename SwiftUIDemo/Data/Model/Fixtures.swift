//
//  Fixtures.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import Foundation

struct Fixtures: Codable, Identifiable {
    let id = UUID()
    let matchDate: String?
    let homeTeam: String?
    let homeTeamImage: String?
    let awayTeam: String?
    let awayTeamImage: String?
    let matchResult: String?
    let leagueName: String
    let matchRound: String?
    
    enum CodingKeys: String, CodingKey {
        case matchDate = "event_date"
        case homeTeam  = "event_home_team"
        case awayTeam  = "event_away_team"
        case matchResult = "event_final_result"
        case leagueName = "league_name"
        case matchRound = "league_round"
        case homeTeamImage = "home_team_logo"
        case awayTeamImage = "away_team_logo"
    }
}
