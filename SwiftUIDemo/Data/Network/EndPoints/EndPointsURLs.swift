//
//  EndPointsURLs.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

struct EndPointsURLs {
    static let baseUrl = "https://apiv2.allsportsapi.com"
    static let APIKey = "45215b196d2ec94b1878e3a48c2f6b3dfb9f91bbe0c8b0098e201ae20cb1b2e6"
    static func getSportLeaguesEndPoint(for sportType: String) -> String {
        EndPointsURLs.baseUrl + "/\(sportType)/?met=Leagues&APIkey=\(EndPointsURLs.APIKey)"
    }
}
