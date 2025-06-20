//
//  LeaguesProtocols.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 20/06/2025.
//

import Foundation


// MARK: - LeaguesViewModelInput
protocol LeaguesViewModelInput {
    func getSportName() -> String
    func getLeagues() -> [SportLeagues]
    func isLoading() -> Bool
}

// MARK: - LeaguesViewModelOutput
protocol LeaguesViewModelOutput {
   
}
