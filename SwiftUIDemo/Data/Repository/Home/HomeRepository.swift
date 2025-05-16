//
//  HomeRepository.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

// MARK: - HomeRepository Protocol
protocol HomeRepositoryProtocol {
    func homeRequest<T: Codable>(with data: Any?, completionHandler: @escaping CompletionHandler<T>)
}

// MARK: - LoginRepository
class HomeRepository: HomeRepositoryProtocol {
    
    private let networkManager: NetworkManagerProtocol
    private let homeRequestConfig: APIEndpointConfig
    
    init(networkManager: NetworkManagerProtocol, homeRequestConfig: APIEndpointConfig) {
        self.networkManager = networkManager
        self.homeRequestConfig = homeRequestConfig
    }
    
    func homeRequest<T: Codable>(with data: Any?, completionHandler: @escaping CompletionHandler<T>) {
        networkManager.request(request: homeRequestConfig.request, completion: completionHandler)
    }
    
}
