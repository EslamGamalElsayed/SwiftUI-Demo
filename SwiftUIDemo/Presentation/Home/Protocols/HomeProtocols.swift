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
}

// MARK: - HomeViewModelOutput
protocol HomeViewModelOutput {
    var nowPlayingMovies: [Movie] { get set }
    var apiRequestError: BaseError? { get set }
}
