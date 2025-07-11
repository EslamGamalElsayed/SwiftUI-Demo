//
//  NetworkManagerProtocol.swift
//  Shipper
//
//  Created by Eslam Gamal on 28/10/2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<T: Codable>(request: APIRequest) async throws -> T
}
