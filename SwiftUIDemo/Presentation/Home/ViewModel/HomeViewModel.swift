//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - typealias
typealias HomeViewModelProtocol = HomeViewModelInput & HomeViewModelOutput & BaseViewModelProtocol

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Variables
    private let homeUseCases: HomeUseCasesProtocol
    private let coordiantor: HomeCoordinator
    @Published var nowPlayingMovies: [Movie] = []
    @Published var apiRequestError: BaseError?
    
    // MARK: - Initiliazer
    init(coordiantor: HomeCoordinator, homeUseCases: HomeUseCasesProtocol) {
        self.coordiantor = coordiantor
        self.homeUseCases = homeUseCases
    }
    @MainActor
    func fetchData() {
        Task {
            do {
                let response: NowPlayingMovies = try await homeUseCases.executeGetNowPlayingMovies(with: nil)
                self.nowPlayingMovies = response.results
            } catch let baseError as BaseError {
                self.apiRequestError = baseError
            } catch {
                self.apiRequestError = BaseError(errorCode: ErrorCode.UNKNOWN_ERROR.rawValue)
            }
        }
    }
}

extension HomeViewModel {
    @MainActor func onAppear() {
        fetchData()
    }
    
    func onDisappear() {
    }
    
    func didTapDetails() {
        coordiantor.navigateToDetailsScreen()
    }
}
