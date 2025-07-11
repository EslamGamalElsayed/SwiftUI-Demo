//
//  FixturesEndPointConfig.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import Foundation

class FixturesConfig: APIEndpointConfig {

    var league: League?
    
    var request: APIRequest {
        return APIRequestBuilder(url: URL(string: EndPointsURLs.getLeagueFixturesEndPoint(for: league ?? League(sportName: "", leagueID: 0))), method: .GET)
            .build()
    }
    
    func updateModel(with data: Any?) {
        guard let data = data as? League else { return }
        league = data
    }
    
}
