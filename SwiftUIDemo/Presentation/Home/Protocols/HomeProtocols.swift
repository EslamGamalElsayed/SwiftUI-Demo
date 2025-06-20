//
//  HomeProtocols.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation

// MARK: - HomeViewModelInput
protocol HomeViewModelInput {
    func didTapDetails()
    func getAllSports() -> [Sport]
}

// MARK: - HomeViewModelOutput
protocol HomeViewModelOutput {

}
