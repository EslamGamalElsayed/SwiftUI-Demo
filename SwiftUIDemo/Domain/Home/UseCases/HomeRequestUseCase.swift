//
//  HomeRequestUseCase.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation
class HomeRequestUseCase: GeneralUseCase {
    
    private let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    func execute<T: Codable>(with data: Any?, completionHandler: @escaping CompletionHandler<T>) {
        homeRepository.homeRequest(with: data, completionHandler: completionHandler)
    }
    
}
