//
//  HomeProtocols.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation

// MARK: - HomeViewModelInput
protocol HomeViewModelInput {
    func getAllSports() -> [Sport]
    func didSelectSport(_ sport: Sport)
}

// MARK: - HomeViewModelOutput
protocol HomeViewModelOutput {

}
