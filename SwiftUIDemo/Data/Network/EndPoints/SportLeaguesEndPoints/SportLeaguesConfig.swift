//
//  SportLeaguesConfig.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation

class SportLeaguesConfig: APIEndpointConfig {

    var sportType: String?
    
    var request: APIRequest {
        return APIRequestBuilder(url: URL(string: EndPointsURLs.baseUrl + EndPointsURLs.getSportLeaguesEndPoint(for: sportType ?? "")), method: .GET)
            .build()
    }
    
    func updateModel(with data: Any) {
        guard let data = data as? String else { return }
        sportType = data
    }
    
}
