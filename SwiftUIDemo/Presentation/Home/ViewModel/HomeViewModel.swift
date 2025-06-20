//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - typealias
typealias HomeViewModelProtocol = HomeViewModelInput & HomeViewModelOutput

class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    
    // MARK: - Variables
    private let coordiantor: HomeCoordinator

    
    // MARK: - Initiliazer
    init(coordiantor: HomeCoordinator) {
        self.coordiantor = coordiantor
        print("ESLAM")
    }
}

// MARK: - HomeViewModel Input
extension HomeViewModel {
    func getAllSports() -> [Sport] {
        [Sport(name: "Football", imageName: "Football"),
         Sport(name: "Basketball", imageName: "Basketball"),
         Sport(name: "Baseball", imageName: "Baseball"),
         Sport(name: "Hockey", imageName: "Hockey")
        ]
    }
}

extension HomeViewModel {

    func didTapDetails() {
        coordiantor.navigateToDetailsScreen()
    }
}
