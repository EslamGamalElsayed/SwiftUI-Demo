//
//  EndPointsURLs.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

struct EndPointsURLs {
    static let baseUrl = "https://apiv2.allsportsapi.com"
    static let APIKey = "e6fd1923373dadb3af6700485f39621002550b664603e1eff202520c3885a46f"
    static func getSportLeaguesEndPoint(for sportType: String) -> String {
        EndPointsURLs.baseUrl + "/\(sportType)/?met=Leagues&APIkey=\(EndPointsURLs.APIKey)"
    }
}
