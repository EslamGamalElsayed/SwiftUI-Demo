//
//  LeagueDetailsViewModel.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 11/07/2025.
//

import Foundation

// MARK: - typealias
typealias LeagueDetailsViewModelProtocol = LeagueDetailsViewModelInput & LeagueDetailsViewModelOutput & BaseViewModelProtocol

// MARK: - LeagueDetailsViewModel

class LeagueDetailsViewModel: ObservableObject, LeagueDetailsViewModelProtocol {
  
    // MARK: - Variables
    private let coordiantor: LeagueDetailsCoordinator
    private let leagueFixturesUseCase: LeagueFixturesUseCaseProtocol
    private var league: League?
    
    
    @Published private var fixtures: [Fixtures] = [] {
        didSet {
            loadingStatus = .STOP
        }
    }
    var apiRequestError: String = ""{
        didSet {
            loadingStatus = .STOP
            showErrorAlert = !apiRequestError.isEmpty
        }
    }
    @Published var loadingStatus: LoadingStatus = .START
    @Published var showErrorAlert: Bool = false

    // MARK: - Initiliazer
    init(coordiantor: LeagueDetailsCoordinator, leagueFixturesUseCase: LeagueFixturesUseCaseProtocol) {
        self.coordiantor = coordiantor
        self.leagueFixturesUseCase = leagueFixturesUseCase
    }
    
    func setupLeague(_ league: League) {
        self.league = league
    }
}

// MARK: - Private Mthods
extension LeagueDetailsViewModel {
    @MainActor
    private func getLeagueFixtures() {
        guard let league = league else { return }
        Task {
            do {
                let response: BaseResponse<[Fixtures]> = try await leagueFixturesUseCase.executeLeagueFixtures(with: league)
                let data = (response.result ?? []).reversed()
                fixtures = Array(data)
            }
            catch let baseError as BaseError {
                self.apiRequestError = baseError.getErrorMessage()
           } catch {
               self.apiRequestError = BaseError(errorCode: ErrorCode.UNKNOWN_ERROR.rawValue).getErrorMessage()
           }
        }
    }
}

extension LeagueDetailsViewModel {
    
    @MainActor func onAppear() {
        loadingStatus = .START
        getLeagueFixtures()
    }
    
    func onDisappear() {}
    
    func getFixtures() -> [Fixtures] {
        fixtures
    }
    
    func isLoading() -> Bool {
        loadingStatus == .START
    }
}
