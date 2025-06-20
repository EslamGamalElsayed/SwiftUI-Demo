//
//  SportLeagues.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation

struct SportLeagues: Codable {
    
    let leagueId:  String?
    let leagueName:  String?
    let countryId: String?
    let countryName: String?
    let leagueImageUrl: String?
    let countryImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case leagueId = "league_key"
        case leagueName = "league_name"
        case countryId = "country_key"
        case countryName = "country_name"
        case leagueImageUrl = "league_logo"
        case countryImageUrl = "country_logo"
    }
    
}
