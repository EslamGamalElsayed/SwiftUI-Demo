//
//  LeaguesViewModel.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - typealias
typealias LeaguesViewModelProtocol = LeaguesViewModelInput & LeaguesViewModelOutput & BaseViewModelProtocol

// MARK: - LeaguesViewModel

class LeaguesViewModel: ObservableObject, LeaguesViewModelProtocol {
    
    // MARK: - Variables
    private let coordiantor: LeaguesCoordinator
    private let leaguesUseCase: SportLeaguesUseCaseProtocol
    private var sportName: String?
    @Published private var leagues: [SportLeagues] = [] {
        didSet {
            loadingStatus = .STOP
        }
    }
    var apiRequestError: String = "" {
        didSet {
            loadingStatus = .STOP
            showErrorAlert = !apiRequestError.isEmpty
        }
    }
    @Published var loadingStatus: LoadingStatus = .START
    @Published var showErrorAlert: Bool = false
    
    // MARK: - Initiliazer
    init(coordiantor: LeaguesCoordinator, leaguesUseCase: SportLeaguesUseCaseProtocol) {
        self.coordiantor = coordiantor
        self.leaguesUseCase = leaguesUseCase
        print("ESLAM")
    }
    
    func setupSportName(_ sportName: String) {
        self.sportName = sportName
    }
    
}

// MARK: - Private Mthods
extension LeaguesViewModel {
    @MainActor
    private func getSportLeagues() {
        guard let sportName = sportName else { return }
        Task {
            do {
                let response: BaseResponse<[SportLeagues]> = try await leaguesUseCase.executeGetSportLeagues(with: sportName)
                leagues = response.result ?? []
            }
            catch let baseError as BaseError {
                self.apiRequestError = baseError.getErrorMessage()
           } catch {
               self.apiRequestError = BaseError(errorCode: ErrorCode.UNKNOWN_ERROR.rawValue).getErrorMessage()
           }
        }
    }
}
 

// MARK: - LeaguesViewModel Input
extension LeaguesViewModel {
    func getSportName() -> String {
        sportName ?? "DEFAULT VALUE"
    }
    
    @MainActor func onAppear() {
        loadingStatus = .START
        getSportLeagues()
    }
    
    func onDisappear() {}
    
    func getLeagues() -> [SportLeagues] {
        leagues
    }
    
    func isLoading() -> Bool {
        loadingStatus == .START
    }
    
    func didTapLeague(league: SportLeagues) {
        guard let sportName = sportName else { return }
        let league = League(sportName: sportName, leagueID: league.leagueId ?? 0)
        coordiantor.navigateToLeagueDetailsScreen(league: league)
    }
}
