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
        [Sport(name: "Football", imageName: "Football", endPointKey: "football"),
         Sport(name: "Basketball", imageName: "Basketball", endPointKey: "basketball"),
         Sport(name: "Baseball", imageName: "Baseball", endPointKey: "Baseball"),
         Sport(name: "Hockey", imageName: "Hockey", endPointKey: "Hockey")
        ]
    }
    
    func didSelectSport(_ sport: Sport) {
        coordiantor.navigateToLeaguesScreen(sportName: sport.name)
    }
}

